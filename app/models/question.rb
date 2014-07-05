class Question < ActiveRecord::Base
  has_and_belongs_to_many :surveys

# Question#results
  def results(survey)
    survey.data.group_by { |choice| choice.question_id }[id]
  end
end