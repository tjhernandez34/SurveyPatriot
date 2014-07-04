class Survey < ActiveRecord::Base
  belongs_to              :user
  has_and_belongs_to_many :questions
  has_many                :rounds
end
