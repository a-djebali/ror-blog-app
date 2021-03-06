class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the R-Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end 

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end 