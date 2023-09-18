class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = policy_scope(Post)
  end

  def show
    authorize @post
    @comment = Comment.new
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to action: :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :photo, :rich_content, :date)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
