class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def super_booksie
    @booksies = User.where(super_booksie: true)
  end
end
