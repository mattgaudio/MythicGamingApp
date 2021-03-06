class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.create(user_params)
    if @user.save 
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def set_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :admin)
  end

end
