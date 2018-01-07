class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env['omniauth.auth']
      user = User.google_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to user_dashboard_path
    elsif params[:session]
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user_dashboard_path
      else
        flash[:error] = "Username or password does not exist. Please sign up for an account."
        render :new
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
