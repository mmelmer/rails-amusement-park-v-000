class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to :controller => 'sessions', :action => 'new' 
      end
  end

  def show
  end

  # def logged_in?
  #   session[:user_id] == @user.id
  # end

  def destroy
    session.clear
    redirect_to '/'
  end

end