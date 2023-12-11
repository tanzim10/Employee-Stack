class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? &&user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to employees_path, notice: "You have successfully logged in!"

    else
      redirect_to login_path, alert: "There was a problem logging in. Please try again."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have successfully logged out!"
  end
  
end
