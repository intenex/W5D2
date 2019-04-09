class SubsController < ApplicationController
  before_action :redirect, only: [:new, :create, :edit, :update]
  before_action :redirect_unless_moderator, only: [:edit, :update]

  def new 
    @sub = Sub.new
    render :new
  end

  def create 
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit 
    @sub = Sub.find_by(id: params[:id])
    if @sub  
      render :edit
    else
      flash[:errors] = ["That sub does not exist"]
      redirect_to subs_url
    end
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub  
      if @sub.update(sub_params)
        redirect_to sub_url(@sub)
      else
        flash[:errors] = @sub.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["That sub does not exist"]
      redirect_to subs_url
    end
  end

  def index 
    @subs = Sub.all 
    render :index
  end

  def show
    @sub = Sub.find_by(id:params[:id])
    render :show
  end

  private
  def sub_params
    params.require(:sub).permit(:title,:description)
  end

  def redirect_unless_moderator
    @sub = Sub.find_by(id: params[:id])
    redirect_to sub_url(@sub) unless @sub.moderator == current_user
  end
end
