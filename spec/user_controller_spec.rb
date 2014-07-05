require 'spec_helper'

describe 'UserController' do

  let(:user) { User.all[0] }

  describe "user authentication" do
    it "all '/users/:user_id/*' routes redirect unless user is logged in" do
      session[:id] = user.id + 1
      get "/users/#{user.id}/*", { user_id: user.id }
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path_info).to eq '/'
    end
  end

  describe "get '/users/:id'" do
    it 'redirects unless user is logged in' do
      session[:id] = user.id + 1
      get "/users/#{user.id}", { user_id: user.id }
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path_info).to eq '/'
    end

    it 'renders the profile template' do
      session[:id] = user.id
      get "/users/#{user.id}", { user_id: user.id }
      expect(last_response).to be_ok
      expect(parsed_body.css('.welcome')[0].content).to include user.name
    end
  end

  describe "get '/users/:user_id/surveys'" do
    let(:another_survey) { Survey.create(user_id: user.id, title: 'Chifogo') }
    it 'shows surveys created by the user' do
      session[:id] = user.id
      get "/users/#{user.id}/surveys", { user_id: user.id }
      expect(last_response).to be_ok
      expect(parsed_body.css('.surveys li h3')).to_not be_empty
    end
  end

  describe "get '/users/:user_id/surveys/create'" do
    it 'renders the create_survey_form template' do
      session[:id] = user.id
      get "/users/#{user.id}/surveys/create"
      expect(parsed_body.css('.create-survey-form')).to_not be_empty
    end
  end

  describe "post '/users/:user_id/surveys/create'" do
    it 'creates and redirects to a new Survey' do
      session[:id] = user.id
      pre_count = Survey.all.count
      post "/users/#{user.id}/surveys/create", {
        user_id: user.id,
        survey: {
          title: 'survey'
        },
        questions: {
          question1: {
            question: 'foo'
            },
          question2: {
            question: 'bar'
          },
          question3: {
            question: 'Chi'
          },
          question4: {
            question: 'fogo'
          }
        }
      }
      expect(Survey.all.count).to eq(pre_count + 1)
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path_info).to eq "/surveys/#{Survey.all.last.id}"
    end
  end
end
