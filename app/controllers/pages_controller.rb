class PagesController < ApplicationController
  def home
    @user = User.new
    @questions = Question.all
  end

  def about

  end
end
