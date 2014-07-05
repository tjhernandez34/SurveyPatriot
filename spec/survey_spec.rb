require 'spec_helper'

describe Survey do
  let(:survey) { Survey.find(1) }
  let!(:questions) do
    [
      Question.create(question: 'foo'),
      Question.create(question: 'bar'),
      Question.create(question: 'Chifogo')
    ]
  end
  let(:new_survey) { Survey.create(title: 'title', user_id: User.all[0].id) }
  let(:params) do
    { choice1: 'this is a choice', choice2: 'we all have a choice to make' }
    end

  describe '#load' do
    it 'adds questions to a survey' do
      expect(new_survey.questions).to be_empty
      new_survey.load(questions, params)
      expect(new_survey.questions.length).to eq 3
    end
  end

  describe '#data' do
    it 'returns an Array of all the Choices connected to the Survey' do
      expect(survey.data).to be_a Array
      expect(survey.data[0]).to be_a Choice
    end
  end
end
