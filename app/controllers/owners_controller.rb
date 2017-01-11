class OwnersController < ApplicationController

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new
    @owner.user = User.find_by(owner_params)
    if @owner.save
      @user = @owner.user
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
      flash[:notice] = "Fumble Fingers. Owner didn't save"
      redirect_to new_user_path
    end

  end

  private

  def owner_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end
