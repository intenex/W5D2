class PostsController < ApplicationController
  before_action :redirect, only: [:new, :create,:edit, :update,:destroy]
  before_action :redirect_unless_author, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
  if @post.save
    redirect_to sub_url(@post)
  else
    flash[:errors] = @post.errors.full_messages
    render :new
  end
end

def edit 
  @post = Post.find_by(id: params[:id])
  if @post  
    render :edit
  else
    flash[:errors] = ["That post does not exist"]
    redirect_to subs_url
  end
end

def update
  @post = Post.find_by(id: params[:id])
  if @post
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  else
    flash[:errors] = ["That post does not exist"]
    redirect_to posts_url
  end
end

def index 
  @posts = Post.all 
  render :index
end

def show
  @post = Post.find_by(id:params[:id])
  render :show
end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def redirect_unless_author
    @post = Post.find_by(id: params[:id])
    redirect_to sub_url(@post.sub) unless @post.author == current_user
  end
end
