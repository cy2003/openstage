class Owner < ApplicationRecord
  has_many :venues
  belongs_to :user

  def create_venue
    @venue = Venue.new(venue_params)
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :street_address_1, :street_address_2, :city, :state, :zip_code)
  end


  # needs to create a venue
  # create login, edit and authenticate for each owner
end
