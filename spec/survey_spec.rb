require 'spec_helper'

describe Survey do
  let!(:questions) do
    [
      Question.create(question: 'foo'),
      Question.create(question: 'bar'),
      Question.create(question: 'Chifogo')
    ]
  end
  let(:survey) { Survey.create(title: 'title', user_id: User.all[0].id) }
  let(:params) do
    { choice1: 'this is a choice', choice2: 'we all have a choice to make' }
    end
  describe '#load' do
    it 'adds questions to a survey' do
      expect(survey.questions).to be_empty
      survey.load(questions, params)
      expect(survey.questions.length).to eq 3
    end
  end
end
