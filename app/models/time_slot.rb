class TimeSlot < ApplicationRecord
  belongs_to :venue
  belongs_to :performer, optional: :true #change this from belongs_to to has_one?
  belongs_to :promoter #through: :venues #do we need this? 

  validates :start_time, :end_time, presence:true
  # validate :promoter?
  # validate :time_slot_available, if: :filled_times
  # validate :check_start_time_is_before_end_time, if: :filled_times
  # validate :date_is_in_future



  # def duration
  # 	end_time - start_time
  # end

  # def promoter?
  # 	if !venue.promoter
  # 		errors.add(:not_correct_user_error, "You must be a promoter of venue to add a new time slot.")
  # 	end
  # end
  # 
  # def date_is_in_future
  # 	date > Date.today
  # end
  # 	


  def filled_times
  	!(start_time.nil? || end_time.nil?)
  end

  def time_slot_available
  	available = true
  	venue.time_slot.each do |time_slot|
  		if(start_time - time_slot.end_time)*(time_slot.start_time - end_time) >=0
  			available = false
  			break
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

end
