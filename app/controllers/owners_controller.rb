class OwnersController < ApplicationController

  private

  def owner_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end
