class Question < ActiveRecord::Base
  has_and_belongs_to_many :surveys

# Question#results
  def results(survey)
    output = {}
    survey.data
  end

end

 # Survey.all[0].data.sort_by {|choice| choice.question_id}



survey.questions.each do |question|
  array = []
  survey.data.select { |choice| choice.}
end
