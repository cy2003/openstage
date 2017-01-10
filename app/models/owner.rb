class Owner < ApplicationRecord
  has_many :venues
  belongs_to :user


  # needs to create a venue
  # create login, edit and authenticate for each owner
end
