class Survey < ActiveRecord::Base
  belongs_to              :user
  has_and_belongs_to_many :questions
  has_many                :rounds

  def load(questions, params)
    questions.each_with_index do |question, index|
      Choice.create({
        question_id: question.id,
        choice: params["choice#{index + 1}".to_sym]
        })
    self.questions << question
    end
  end
end
