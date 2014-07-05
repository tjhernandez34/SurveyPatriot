class Question < ActiveRecord::Base
  has_and_belongs_to_many :surveys

  def results(survey)
  	data(survey).group_by { |choice| choice.id }
  end

  def data(survey)
    survey.data.group_by { |choice| choice.question_id }[id]
  end

  def edit(index, params)
    question.update(question: params[:questions]["question_#{index + 1}".to_sym])
    choice_num = 1
    @choices.select { |choice| choice.question_id == question.id}.each do |choice|
      choice.update(choice: params["choice_#{choice_num}".to_sym])
      choice_num += 1
    end
  end
end
