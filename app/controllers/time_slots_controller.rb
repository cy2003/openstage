class TimeSlotsController < ApplicationController

	#before_action :authenticate_user

	def index
		@time_slots = TimeSlot.all 
	end

	def new
		#binding.pry
		# if authenticate_promoter
			@time_slot = TimeSlot.new
		# else
		# 	flash[:notice] = "You must be a promoter to create a new time slot. SORRY!!!"
		# 	redirect_to time_slots_path and return
		# end
	end

	def create
		@time_slot = TimeSlot.new(time_slot_params)
		if @time_slot.save
			redirect_to time_slot_path
		else
			flash[:notice] = "The time slot you have specified is already on the schedule or is not valid (ie start time is after end time. Please try again)."
      		redirect_to new_time_slot_path
      	end
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
	end


	private

	def time_slot_params
		params.require(:time_slot).permit(:date, :start_time, :end_time, :promoter_id)
	end

end
