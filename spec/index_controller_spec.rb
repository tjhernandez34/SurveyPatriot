require 'spec_helper'

system 'clear'

describe 'IndexController' do
  include BCrypt
  describe "get '/'" do
    it 'renders the index template' do
      get '/'
      expect(parsed_body.css('.login-form')).to_not be_empty
    end
  end

  describe "post '/login'" do

    let(:user) { User.all[0] }

    it "redirects to '/signup' if user does not exist" do
      post '/login', { user: { email: 'qwertyuiop@werty.com', password: 'foo'} }
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path_info).to eq '/signup'
    end

    it 'logs in a valid user' do
      get "/users/#{user.id}"
      expect(last_response).to be_redirect
      session[:id] = user.id
      get "/users/#{user.id}"
      expect(last_response).to be_ok
    end
  end

  describe "post '/signup'" do

    it 'creates a new User' do
      user_count = User.all.count
      post '/signup', { user: { name: 'Ron Swanson', email: 'noneofyour@damn.biz', password: 'whiskey' } }
      expect(User.all.count).to eq(user_count + 1)
      expect(last_response).to be_redirect
    end
  end
end
