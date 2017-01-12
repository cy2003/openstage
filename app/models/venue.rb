class Venue < ApplicationRecord
  belongs_to :promoter, optional: true
  has_many :time_slots
  belongs_to :owner
  has_many :performers, through: :time_slots



  validates :name, :street_address_1, :city, :state, :zip_code, presence:true

  # create and edit for each venue
  # convert address to google maps - icebox
  # limit to a few cities - New York, Brooklyn, Queens
  # have an index where you list all the venues
  # select venues in city
  # select performers in venue
  # 
  def maps_url
   if self.street_address_1 != nil
     "https://www.google.com/maps/place/" + "#{space_for_plus_sub(self.street_address_1)}" + "+#{self.city}" + "+#{self.state}" + "+#{self.zip_code}"
   end
 end

 def city_state_zip
   if self.street != nil
     "#{self.city}, #{self.state} #{self.zip}"
   end
 end

 def space_for_plus_sub(street)
   street.gsub(" ", "+")
 end

end
