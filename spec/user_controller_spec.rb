require 'spec_helper'

describe 'UserController' do
  
  let(:user) { User.all[0] }
  
  describe "get '/users/:id'" do
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
end
