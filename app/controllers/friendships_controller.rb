class FriendshipsController < ApplicationController
  def index
    @friendships = policy_scope(Friendship)
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    authorize @friendship
    @friendship.destroy
    redirect_to user_path(@user)
  end

  def followers
    @followers = Friendship.where(receiver: current_user)
  end

  def followings
    @followings = Friendship.where(asker: current_user)
  end
end
