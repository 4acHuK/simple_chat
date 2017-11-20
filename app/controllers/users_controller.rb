class UsersController < ApplicationController

  before_action :restrict_user, except: [:new, :create]

  def restrict_user
    redirect_to root_path unless current_user
  end

  def index
    @users = User.all_except(current_user)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = "Account registered!"
      redirect_to users_path
    else
      render :new
    end
  end

  def friendship_action
    user = User.find(params[:id])
    friend = User.find(params[:friend_id])
    user.send(params[:action_type], friend)
    redirect_back fallback_location: users_path
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end