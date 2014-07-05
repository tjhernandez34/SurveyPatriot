class Question < ActiveRecord::Base
  has_and_belongs_to_many :surveys

  def data(survey)
    survey.data.group_by { |choice| choice.question_id }[id]
  end
end