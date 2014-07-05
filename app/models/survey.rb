class Survey < ActiveRecord::Base
  validates_presence_of :title, :user_id

  belongs_to              :user
  has_and_belongs_to_many :questions
  has_many                :rounds

  def load(questions, params)
    questions.each_with_index do |question, index|
      (1..4).each do |num|
      Choice.create({
        question_id: question.id,
        choice: params["choice_#{index + 1}#{num}".to_sym]
        })
    end
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

  def edit(params)
    self.update(title: params[:title])
    questions.each_with_index do |question, index|
      question.edit(index, params)
    end
  end



end
