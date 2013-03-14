class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to(user_path(@user))
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
    @wins_count = @user.answers.where("winner = ?", :winner => true).count
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts @user.inspect
  end



end
