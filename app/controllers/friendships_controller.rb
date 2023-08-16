class FriendshipsController < ApplicationController
  def index
    @friendships = policy_scope(Friendship)
  end

  def create
    @user = User.find(params[:id])
    @friendship = Friendship.new()
    @friendship.asker = current_user
    @friendship.receiver = @user
  end
end
