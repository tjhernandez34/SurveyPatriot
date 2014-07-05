class Survey < ActiveRecord::Base
  belongs_to              :user
  has_and_belongs_to_many :questions
  has_many                :rounds

  def load(questions, params)
    questions.each_with_index do |question, index|
      Choice.create({
        question_id: question.id,
        choice: params["choice_#{index + 1}".to_sym]
        })
    self.questions << question
    end
  end

  def results
    # do we really need a #results for Survey? Question#results may be sufficient
  end

  def data
    raw_data = []
    rounds.each do |round|
      round.choices.each { |choice| raw_data << choice }
    end
    raw_data.flatten.sort
  end
end
