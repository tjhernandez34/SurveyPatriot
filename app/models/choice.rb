class Choice < ActiveRecord::Base
	validates_presence_of :choice, :question_id
	
  has_and_belongs_to_many :rounds
  belongs_to              :question
end
