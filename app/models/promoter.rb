class Promoter < ApplicationRecord
  has_many :venues
  has_one :user
  has_many :time_slots, through: :venues
  has_many :performers, through: :venues
  


  # approves performers that request time slots
  # confirm they are a promoter before creating time slots and approving performers
  # create login, edit and authenticate for each promoter

end
