class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_dashboard_path
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
    redirect_to user_path(current_user)
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    if user.save
      flash[:success] = "Your profile information was succesfully updated"
    else
      flash[:error]= "Something went wrong. Please try again."
    end
  end

private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
