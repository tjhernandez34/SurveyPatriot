require 'spec_helper'

describe 'UserController' do
  describe "get '/users/:id'" do
    it 'renders the profile template' do
      get '/'
      expect(last_response).to be_ok
    end
  end
end
