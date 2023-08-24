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
    @followers = current_user.friendships_as_receiver
    authorize @followers
  end

  def followings
    @followings = current_user.friendships_as_asker
    authorize @followings
  end
end
