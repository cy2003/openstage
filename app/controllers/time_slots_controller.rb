class TimeSlotsController < ApplicationController

	#before_action :authenticate_user

	def index
		puts "Hello World"
		#@time_slots = TimeSlot.all
	end

	def new
		#binding.pry
		# if authenticate_promoter
			@venue = Venue.find(params[:venue])
			@time_slot = TimeSlot.new
		# else
		# 	flash[:notice] = "You must be a promoter to create a new time slot. SORRY!!!"
		# 	redirect_to time_slots_path and return
		# end
	end

	def create

		@time_slot = TimeSlot.new(time_slot_params)

		#adding the specified date to the start and end times
		# @time_slot.start_time = (@time_slot.date.to_s + " " + @time_slot.start_time.strftime("%H:%M:%S")).to_datetime.utc
		# @time_slot.end_time = (@time_slot.date.to_s + " " + @time_slot.end_time.strftime("%H:%M:%S")).to_datetime.utc
		if @time_slot.save
			redirect_to time_slot_path(@time_slot)
		else
			flash[:notice] = "The time slot you have specified is already on the schedule or is not valid (ie start time is after end time. Please try again)."
      		redirect_to new_time_slot_path
		end

 	end

	def edit
		@time_slot = TimeSlot.find(params[:id])
	end

	def update
		@time_slot = TimeSlot.find(params[:id])
		if @time_slot.update(time_slot_params)
			redirect_to time_slot_path(@time_slot)
		else
			flash[:notice] = "Update not valid. Try again."
			render :edit
		end

	end

	def show
		@time_slot = TimeSlot.find(params[:id])
	end

	def destroy
		@time_slot = TimeSlot.find(params[:id])
		@venue = @time_slot.venue
		@time_slot.destroy
		flash[:notice] = "Your time slot has been deleted"
		redirect_to venue_path(@venue)
	end


	private

	def time_slot_params
		params.require(:time_slot).permit(:date, :start_time, :end_time, :promoter_id, :performer_id, :venue_id)
	end

end
