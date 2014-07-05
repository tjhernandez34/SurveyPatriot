require 'spec_helper'

describe 'SurveyController' do
    let(:user) { User.create(name: 'Ron', email: 'ron@swanson.com', password: "foo") }
    let(:survey) { Survey.all[-1] }
    let(:question1) { Question.create(question: 'WTF?') }
    let(:question2) { Question.create(question: 'LOL') }

    after(:all) { survey.destroy }

  describe "get '/surveys'" do
    it 'renders the surveys template' do
      get '/surveys'
      expect(last_response).to be_ok
      expect(parsed_body.css('.survey-title')[-1].content).to eq(survey.title)
    end
  end

  describe "get '/surveys/:survey_id'" do
    it 'creates a new Round' do
      round_count = Round.all.count
      get "/surveys/#{survey.id}"
      expect(Round.all.count).to eq(round_count + 1)
    end

    it 'displays the survey title' do
      get "/surveys/#{survey.id}"
      expect(parsed_body.css('.survey-title')[-1].content).to eq(survey.title)
    end

    it 'displays all questions for each survey' do
      [question1, question2].each { |q| survey.questions << q }
      get "/surveys/#{survey.id}"
      expect(parsed_body.css('.questions li')).to_not be_empty
    end
  end

  describe "post '/surveys/:survey_id'" do
    it 'adds a Choice to the current Round' do
      current_round = survey.rounds.last
      current_round_choice_count = current_round.choices.count
      session[:round_id] = current_round.id
      post "/surveys/#{survey.id}", { answer: { "1" => Choice.all[0].id } }
      expect(current_round.choices.count).to eq(current_round_choice_count + 1)
    end
  end
end
