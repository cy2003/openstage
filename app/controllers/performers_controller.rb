class PerformersController < ApplicationController
  before_action :individual_performer, only: [:show, :edit, :update, :destroy]

  def index
    @performers = Performer.all
  end

  def new
    @performer = Performer.new
  end

  def create

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

  def performer_params
    params.require(:performers).permit(:first_name, :last_name, :street, :apt, :city, :state, :zip, :office_id, :ext, :email, :phone, :username, :password)
  end

  def individual_performer
    @performer = Performer.find(params[:id])
  end

end
