class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit 
    @user = User.find_by(id: params[:id])
    if @user  
      render :edit
    else
      flash[:errors] = ["That user does not exist"]
      redirect_to users_url
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user  
      if @user.update(user_params)
        redirect_to user_url(@user)
      else
        flash[:errors] = @user.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["That user does not exist"]
      redirect_to users_url
    end
  end

  def index 
    @users = User.all 
    render :index
  end

  def show
    @user = User.find_by(id:params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
