class Choice < ActiveRecord::Base
  has_and_belongs_to_many :rounds
  belongs_to              :question
end
