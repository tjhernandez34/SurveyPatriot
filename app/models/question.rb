class Question < ActiveRecord::Base
  validates_presence_of :question
  
  has_and_belongs_to_many :surveys

  def results(survey)
  	data(survey).group_by { |choice| choice.choice }
  end

  def data(survey)
    survey.data.group_by { |choice| choice.question_id }[id]
  end

  # def choice_percentage(choice, survey)
  #   # returns a float percentage, i.e. '25.0'
  #   (choice.length / data(survey).length.to_f) * 100
  #   # choice.choice
  # end

  def edit(index, params)
    question.update(question: params[:questions]["question_#{index + 1}".to_sym])
    choice_num = 1
    @choices.select { |choice| choice.question_id == question.id}.each do |choice|
      choice.update(choice: params["choice_#{choice_num}".to_sym])
      choice_num += 1
    end
  end

  # def to_s(survey)
  #   results(survey).each do |choice, votes|
  #     "#{choice}: #{(votes.length / data(survey).length.to_f) * 100}%"
  #   end
  # end
end


# s.questions.first.results(s).each { |key, val| p "#{key}: #{(val.length / s.questions[0].data(s).length.to_f) * 100}%" }
# @question.results(@survey).each { |key, val| p "#{key}: #{(val.length / @question.data(@survey).length.to_f) * 100}%" }
