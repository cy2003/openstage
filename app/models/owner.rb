class Owner < ApplicationRecord
  has_many :venues
  has_secure_password

  validates :first_name, :last_name, :email_address, presence:true

  # needs to create a venue
  # create login, edit and authenticate for each owner
end
