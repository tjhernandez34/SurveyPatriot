require 'spec_helper'

describe User do
  describe '#logged_in?' do
    let(:user) { User.all[0] }
    it 'redirects if user is not logged in' do
      session[:id] = user.id
      get "/users/#{user.id}", { user_id: user.id }
      expect(last_response).to be_ok
      get "/users/#{user.id + 1}", { user_id: user.id }
      expect(last_response).to be_redirect
    end
  end
end
