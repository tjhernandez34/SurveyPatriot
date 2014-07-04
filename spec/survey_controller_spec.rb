require 'spec_helper'
system 'clear'
describe 'SurveyController' do
  describe "get '/surveys'" do
    it 'returns 200 status code' do
      get '/surveys'
      expect(last_response).to be_ok
    end

    it 'displays each survey title'
  end
end
