class Round < ActiveRecord::Base
	validates_presence_of :user_id, :survey_id
	
  belongs_to                :user
  belongs_to                :survey
  has_and_belongs_to_many   :choices
end
