class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user and @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = "uhoh you no sign in"
      render :new
    end  
  end

  def destroy
    session.clear
    redirect_to root_path
  end


end

