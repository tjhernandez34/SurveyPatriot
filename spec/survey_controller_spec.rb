require 'spec_helper'
system 'clear'
describe 'SurveyController' do

  describe "get '/surveys'" do
    let(:user) { User.create(name: 'Ron', email: 'ron@swanson.com', password: "foo") }
    let(:survey) { Survey.create(title: 'Chifago', user_id: user.id) }
    let(:question1) { Question.create(question: 'WTF?') }
    let(:question2) { Question.create(question: 'LOL') }

    it 'returns 200 status code' do
      get '/surveys'
      expect(last_response).to be_ok
    end

    it 'displays each survey title' do
      get '/'
      p survey.title
      expect(parsed_body.css('.survey-title')[0]).to eq("Chifago")
    end

    it 'displays all questions for each survey' do
      [question1, question2].each { |q| survey.questions << q }
      get '/'
      p question1.question
      expect(parsed_body.css('.questions li')[0]).to eq("WTF?")
    end
  end
end
