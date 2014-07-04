require 'spec_helper'

describe 'UserController' do
  describe "get '/users/:id'" do
    let(:user) { User.all[0] }
    it 'renders the profile template' do
      get "/users/#{user.id}"
      expect(last_response).to be_ok
      expect(parsed_body.css('.welcome')[0].content).to include user.name
    end
  end
end
