class TimeSlot < ApplicationRecord
  belongs_to :venue
  belongs_to :performer
  belongs_to :promoter, through: :venue

  validates :start_time, :end_time, presence:true


  # make sure time slot is available
  # time slot is in the future
  # time max 4 hours
  # it should know if it's available, pending, booked.
  # end time has to be after the start time
  # confirm that a promoter is creating it.
  # confirm that performer is requesting it.
  # create and edit time slots 

end
