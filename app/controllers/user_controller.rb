class UserController < ApplicationController
  def new
    @user = User.new
  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have successfully signed up!"
    else
      puts @user.errors.full_messages
      redirect_to signup_path, notice: "There was a problem signing up. Please try again."
    end


  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
