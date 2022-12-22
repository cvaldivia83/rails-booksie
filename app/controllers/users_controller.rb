class UsersController < ApplicationController
  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :photo, :email, :password, :remember_me)
  end
end
