class UsersController < ApplicationController

  def show
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:photo)
  end
end
