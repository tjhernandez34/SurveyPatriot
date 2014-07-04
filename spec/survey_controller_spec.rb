require 'spec_helper'
system 'clear'
describe 'SurveyController' do
  describe "get '/surveys'" do
    let(:survey) { Survey.create(title: 'Chifago', user_id: 1) }
    it 'returns 200 status code' do
      get '/surveys'
      expect(last_response).to be_ok
    end

    it 'displays each survey title' do
      get '/'
      expect(parsed_body.css('.survey-title')[0]).to eq("Chifago")
    end
  end
end
