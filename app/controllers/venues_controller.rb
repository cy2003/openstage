class VenuesController < ApplicationController

	def index
		@venues = Venue.all
	end

	def new
		# if authenticate_owner
			@venue = Venue.new
	# 	else
	# 		flash[:notice] = "You must be an owner to create a new venue. SORRY!!!"
	# 		redirect_to attractions_path and return
	# 	end
	#
	end

	def create
		binding.pry
		@venue = Venue.new(venue_params)
		if @venue.save
			redirect_to venues_path
		else
			flash[:notice] = "The venue you entered is not valid. Please try again."
      redirect_to new_venue_path
		end
	end

	def edit
		@venue = Venue.find(params[:id])
	end

	def update
		@venue = Venue.find(params[:id])
		if @venue.update(venue_params)
			redirect_to venue_path(@venue)
		else
			flash[:notice] = "Update not valid. Try again."
			render :edit
		end

	end

	def show
		@venue = Venue.find(params[:id])
	end

	def destroy
		@venue = Venue.find(params[:id])
		@venue.destroy
		@venue.time_slots.destroy
		flash[:notice] = "Your time slot has been deleted"
		redirect_to venues_path

	end


	private

	def venue_params
		params.require(:venue).permit(:name, :street_address_1, :street_address_2, :city, :state, :zip_code, :owner_id, :promoter_id)
	end


end
