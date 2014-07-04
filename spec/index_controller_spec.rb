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
    it ''
  end
end
