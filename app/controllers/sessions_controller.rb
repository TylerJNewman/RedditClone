class SessionsController < ApplicationController
  def new
    @sign = true
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],params[:user][:password])
    if @user
      session[:session_token]= @user.reset_session_token!
      redirect_to subs_url
      # redirect_to #homepage reddit
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @user.reset_session_token!
    session[:session_token]= nil
    render :new
  end
end
