class TimeSlotApplicationsController < ApplicationController

  def index
    @timeslots = TimeSlot.all
    @timeslotapplications = TimeSlotApplication.all
  end

  def new
    @timeslotapplication = TimeSlotApplication.new
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
    @timeslotapplication = TimeSlotApplication.find(params[:id])
    @timeslot = TimeSlot.find(@timeslotapplication.time_slot.id)
    @timeslot.time_slot_applications.each do |timeslotapplication|
      if timeslotapplication.id != @timeslotapplication.id
        timeslotapplication.update(status: "Denied")
      end
    end
    @timeslot.update(status: params[:status], performer_id: params[:performer_id])
    @timeslotapplication.update(status: params[:status])
    redirect_to time_slot_applications_path
  end
end
