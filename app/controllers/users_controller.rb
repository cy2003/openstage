class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = user.new(user_params)
    if password_exists && @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Failed to create your account please try again"
      redirect_to root_path
    end
  end

  def edit
  end

  def show
  end

  def create
  end

  def destroy
  end

  private

  def password_exists
    @user.password
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :phone_number, :owner, :performer, :promoter)
  end
end
