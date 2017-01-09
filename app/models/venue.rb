class Venue < ApplicationRecord
  belongs_to :promoter
  has_many :time_slots
  belongs_to :owner
  has_many :performers, through: :time_slots

  validates :name, :street_address_1, :street_address_2, :city, :state, :zip_code, presence:true

  # create and edit for each venue
  # convert address to google maps - icebox
  # limit to a few cities - New York, Brooklyn, Queens
  # have an index where you list all the venues
  # select venues in city
  # select performers in venue

end
