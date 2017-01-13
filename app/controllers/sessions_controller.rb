class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email]) #email is unique id
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      flash[:notice] = "Email or password was incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:logout] = 'Logged out!'
    redirect_to root_path
  end



  private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
