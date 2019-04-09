class CommentsController < ApplicationController
  before_action :redirect
  
  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.error.full_messages
      render :new
    end
  end

  def show 
    @comment = Comment.find_by(id: params[:id])
    render :show
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end
