class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
  
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end
end
