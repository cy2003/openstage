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

    if current_user
      if current_user.owner.venue == venue.owner
        render :edit
      end
    else
    end
	end

	def update
	end

	def show
		@venue = Venue.find(params[:id])
	end

	def destroy
	end


	private

	def venue_params
		params.require(:venue).permit(:name, :street_address_1, :street_address_2, :city, :state, :zip_code, :owner_id, :promoter_id)
	end


end
