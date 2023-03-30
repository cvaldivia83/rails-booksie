class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def super_booksie
    @booksies = User.where(super_booksie: true)
    authorize @booksies
  end
end
