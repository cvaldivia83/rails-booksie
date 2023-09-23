class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    authorize @like
    if @like.save
      redirect_to allow_other_host: true
    else
      redirect_to allow_other_host: true, status: :unprocessable_entity
      flash[:alert] = "You already liked this."
    end
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
