class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
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
