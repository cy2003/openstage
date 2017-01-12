class TimeSlotApplicationsController < ApplicationController

  def new

  end

  def create
    @timeslotapplication = TimeSlotApplication.create(performer_id: params[:performer_id], time_slot_id: params[:time_slot_id], status: params[:status])
    flash[:notice] = "Your request has been made."
    redirect_to user_path(current_user)
  end

  def edit

  end

  def update

  end
end
