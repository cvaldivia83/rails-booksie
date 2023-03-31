class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @posts = policy_scope(Post)
  end

  def show
    authorize @post
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
