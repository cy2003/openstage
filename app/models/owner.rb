class Owner < ApplicationRecord
  has_many :venues
  has_one :user

  # needs to create a venue
  # create login, edit and authenticate for each owner
end
