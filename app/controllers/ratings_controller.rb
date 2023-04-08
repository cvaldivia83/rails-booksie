class RatingsController < ApplicationController
  def create
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
