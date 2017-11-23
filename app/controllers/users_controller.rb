class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def home
  end


  def show
    @user = User.find(params[:id])
    @message = params[:message] if params[:message]
    if logged_in?
      render :show 
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

  def logged_in?
    session[:user_id]
  end

end