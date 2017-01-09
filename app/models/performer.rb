class Performer < ApplicationRecord
  has_many :time_slots
  has_many :venues, through: :time_slots
  has_many :promoters, through: :time_slots
  has_secure_password

  validates :performer_name, :email_address, presence:true

  # view and request for time slots
  # make requirment that if time slot is accepted it's automatically confirmed.
  # confirm that they are a performer when they ask for time slot.
  # create login, authenticate and edit for each performer
  # list of performers that are performing in upcoming shows - icebox
end
