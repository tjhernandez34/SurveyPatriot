require 'spec_helper'

system 'clear'

describe 'IndexController' do
  describe "get '/'" do
    it 'renders the index template' do
      get '/'
      expect(parsed_body.css('.login-form')).to_not be_empty
    end
  end

  describe "post '/login'" do
    it "redirects to '/signup' if user does not exist" do
      post '/login', { user: { email: 'qwertyuiop@werty.com', password: 'foo'} }
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path_info).to eq '/signup'
    end
  end
end
