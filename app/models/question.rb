class Question < ActiveRecord::Base
  has_and_belongs_to_many :surveys

  def results(survey)
  	data(survey).group_by { |choice| choice.id }
  end

  def data(survey)
    survey.data.group_by { |choice| choice.question_id }[id]
  end
end