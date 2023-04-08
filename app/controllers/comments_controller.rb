class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @date = Date.today
    @comment.date = @date
    @comment.user = current_user
    @comment.post = @post
    authorize @comment

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to post_path(@post) }
        format.json
      else
        format.html { render 'posts/show', status: :unprocessable_entity }
        format.json
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.update(comment_params)

    respond_to do |format|
      format.html { redirect_to posts_path }
      format.text { render partial: 'comments/comment', locals: { comment: @comment }, formats: [:html] }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
