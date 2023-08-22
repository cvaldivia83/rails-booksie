class FriendshipsController < ApplicationController
  def index
    @friendships = policy_scope(Friendship)
  end

  def destroy
    @user = User.find(params[:id])
    @friendship = Friendship.where(asker: current_user, receiver: @user).or(Friendship.where(receiver: current_user, asker: @user)).first
    authorize @friendship
    @friendship.destroy
  end

end
