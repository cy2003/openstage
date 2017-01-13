class TimeSlotApplicationsController < ApplicationController

  def index
    @@timeslotapplications = TimeSlotApplication.all
  end

  def new
    @@timeslotapplication = TimeSlotApplication.new
  end

  def create
    @timeslotapplication = TimeSlotApplication.create(performer_id: params[:performer_id], time_slot_id: params[:time_slot_id], status: params[:status])
    
    @time_slot = TimeSlot.find(params[:time_slot_id])
    @time_slot.status = params[:status]
    @time_slot.save
    flash[:notice] = "Your request has been made."
    redirect_to user_path(current_user)
  end

  def edit

  end

  def update

  end
end
