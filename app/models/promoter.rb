class Promoter < ApplicationRecord
  has_many :venues
  has_many :time_slots, through: :venues
  has_many :performers, through: :venues
  has_secure_password

  validates :first_name, :last_name, :email_address, presence:true

  # approves performers that request time slots
  # confirm they are a promoter before creating time slots and approving performers
  # create login, edit and authenticate for each promoter

end
