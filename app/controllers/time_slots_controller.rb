class TimeSlotsController < ApplicationController

	#before_action :authenticate_user

	def index
		puts "Hello World"
		#@time_slots = TimeSlot.all
	end

	def new
		@venue = Venue.find(params[:venue_id])
		@time_slot = TimeSlot.new
		@performers = Performer.all


		#binding.pry
		# if authenticate_promoter
		# else
		# 	flash[:notice] = "You must be a promoter to create a new time slot. SORRY!!!"
		# 	redirect_to time_slots_path and return
		# end
	end

	def create

		@time_slot = TimeSlot.new(time_slot_params)
		if @time_slot.performer_id
		
			@time_slot.status = "booked"
			if @time_slot.save
				redirect_to time_slot_path(@time_slot)
			else
				flash[:notice] = "The time slot you have specified is already on the schedule or is not valid (ie start time is after end time. Please try again)."
      	redirect_to venue_path(@time_slot.venue_id)
			end
		else
			if @time_slot.save
				redirect_to time_slot_path(@time_slot)
			else
				flash[:notice] = "The time slot you have specified is already on the schedule or is not valid (ie start time is after end time. Please try again)."
      	redirect_to venue_path(@time_slot.venue_id)
			end
		end

 	end

	# def request
	# 	@time_slot = TimeSlot.find(params[:id])
	# 	@time_slot.update_attributes(status: "pending")
	# end

	def edit
		@time_slot = TimeSlot.find(params[:id])
	end

	def update
		@time_slot = TimeSlot.find(params[:id])
		if @time_slot.update(time_slot_params)
			if @time_slot.status == "booked"
				binding.pry
				if @time_slot.time_slot_applications.each do |time_slot_application|
					time_slot_application.status = ""
				end
				end
			end


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
		params.require(:time_slot).permit(:date, :start_time, :end_time, :promoter_id, :performer_id, :venue_id, :status)
	end

end
