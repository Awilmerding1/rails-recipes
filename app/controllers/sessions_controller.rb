class SessionsController < ApplicationController

  def fb_create
    @user = User.find_or_create_by(username: auth["info"]["email"])
    if !@user.password
      @user.password = 'omniauth_password' #random generator
    end
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def auth
    request.env["omniauth.auth"]
  end

end
