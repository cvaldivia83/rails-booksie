class FriendshipsController < ApplicationController
  def index
    @friendships = policy_scope(Friendship)
  end

  def create
    @friendship = Friendship.new(asker: current_user, receiver_id: params[:user_id].to_i)
    authorize @friendship
    @friendship.save
    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
  end


  def destroy
    @friendship = Friendship.find(params[:id])
    authorize @friendship
    @friendship.destroy
    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
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
