class HomeController < ApplicationController
  def index
    if !Current.user
      redirect_to signin_path, alert: "You must be signed in to do that."
    end

  end

  def aboutus
  
  end  
end
