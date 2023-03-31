class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :super_booksie
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def super_booksie
    @booksies = User.where(super_booksie: true)
    authorize @booksies
  end
end
