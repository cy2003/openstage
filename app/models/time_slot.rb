class TimeSlot < ApplicationRecord
  belongs_to :venue
  belongs_to :performer, optional: true #change this from belongs_to to has_one?
  belongs_to :promoter, optional: true #through: :venues #do we need this?
  has_many :time_slot_applications

  validates :start_time, :end_time, presence:true

  # validate :promoter?
  validate :time_slot_available, if: :filled_times
  validate :check_start_time_is_before_end_time, if: :filled_times
  validate :date_is_in_future



  # def duration
  # 	end_time - start_time
  # end

  # def promoter?
  # 	if !venue.promoter
  # 		errors.add(:not_correct_user_error, "You must be a promoter of venue to add a new time slot.")
  # 	end
  # end
  #
  #
  def date_is_in_future
  	if date < Date.today
  		errors.add(:date_error, "Time slot must be in the future.")
  	end
  end



  def filled_times
  	!(start_time.nil? || end_time.nil?)
  end

  def time_slot_available
  	available = true

  	venue = Venue.find(self.venue_id)
    	venue.time_slots.each do |time_slot|
        unless self.id == time_slot.id

      		if time_slot.date == date
    	  		if(start_time - time_slot.end_time)*(time_slot.start_time - end_time) >=0
    	  			available = false
    	  			break
    	  		end
    	  	else
    	  	end
        end
    	end
    	if !available
    			errors.add(:availability_error, "Time slot is not available during these times.")
    	end
  end



  def check_start_time_is_before_end_time
  	if start_time >= end_time
  		errors.add(:time_errors, "Start time must be before end time.")
  	end
  end


  # make sure time slot is available
  # time slot is in the future
  # time max 4 hours
  # it should know if it's available, pending, booked.
  # end time has to be after the start time
  # confirm that a promoter is creating it.
  # confirm that performer is requesting it.
  # create and edit time slots


end
