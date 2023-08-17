class FriendshipsController < ApplicationController
  def index
    @friendships = policy_scope(Friendship)
  end

  def create
    # @user = User.find(params[:id])

  end
end
