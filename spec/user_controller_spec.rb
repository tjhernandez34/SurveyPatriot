require 'spec_helper'

describe 'UserController' do
  describe "get '/users/:id'" do
    let(:user) { User.all[0] }
    it 'renders the profile template' do
      session[:id] = user.id
      get "/users/#{user.id}", { user_id: user.id }
      expect(last_response).to be_ok
      expect(parsed_body.css('.welcome')[0].content).to include user.name
    end
  end

  describe "get '/users/:user_id/surveys'" do
    it 'shows '
  end
end
