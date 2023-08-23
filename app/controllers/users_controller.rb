class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :super_booksie

  def show
    @user = User.find(params[:id])
    authorize @user
    if @user.geocoded?
      @markers = {
        lat: @user.latitude,
        long: @user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: @user })
      }
    end

    # Friendship - Destroy
    @friends = Friendship.find_by(asker: current_user, receiver: @user) || Friendship.find_by(asker: @user, receiver: current_user)

    # Friendship - Create
    @friendship = Friendship.new(asker: current_user, receiver: @user)
    authorize @friendship
    @friendship.save
  end

  def super_booksie
    @booksies = policy_scope(User)
    authorize @booksies
    @testimonials = ["Entrepreneur creating spaces at the intersection of identity and history.", "A pillar of the community sharing not only books, but also her hometown and culture.", "Homesteader bringing life back to a community that otherwise would have been forgotten.", "Rendez-vous at the next storyline and debate about society, consumption and art.", "A constant member in our community in love with adventures and fantasy stories.", "There\’s no one way to share. You might be surprised by how much fun you have."]
  end

end
