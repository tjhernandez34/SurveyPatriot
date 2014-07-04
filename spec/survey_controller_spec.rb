require 'spec_helper'
system 'clear'
describe 'SurveyController' do
    let(:user) { User.create(name: 'Ron', email: 'ron@swanson.com', password: "foo") }
    let(:survey) { Survey.create(title: 'Chifago', user_id: user.id) }
    let(:question1) { Question.create(question: 'WTF?') }
    let(:question2) { Question.create(question: 'LOL') }

    after(:all) { survey.destroy }

  describe "get '/surveys'" do
    it 'returns 200 status code' do
      get '/surveys'
      expect(last_response).to be_ok
    end

    it 'displays each survey title' do
      get '/surveys'
      expect(parsed_body.css('.survey-title')[-1].content).to eq("Chifago")
    end
  end

  describe "get '/surveys/:survey_id'" do
    it 'displays each survey title' do
      get "/surveys/#{survey.id}"
      expect(parsed_body.css('.survey-title')[-1].content).to eq("Chifago")
    end

    it 'displays all questions for each survey' do
      [question1, question2].each { |q| survey.questions << q }
      get "/surveys/#{survey.id}"
      p question1.question
      expect(parsed_body.css('.questions li')[0]).to_not be_empty
    end
  end
end
