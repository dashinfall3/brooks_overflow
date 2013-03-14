class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(params[:answer])
    if @answer.save
      flash[:success] = "your answer has been added"
      redirect_to question_path(@answer.question)
    else
      flash[:error] = "yo  your answer no worky"
      @question = @answer.question
      render 'questions/show'
    end
  end

  # post '/comments' do
  #   @comments = Comment.find(params[])
  # end

  def comments 
    @answer = Answer.find(params[:id])
    @comment = @answer.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "you comment on dat answer"
      redirect_to question_path(@answer.question)
    else
      flash[:error] = "you no comment on dat answer"
      @question = @answer.question
      render 'questions/show'
    end
  end
  
  def votes
    @answer = Answer.find(params[:id])
    @vote = @answer.votes.build({:user_id => current_user.id})
    if @vote.save
      flash[:success] = "What a good citizen. You voted."
      redirect_to question_path(@answer.question)
    else
      flash[:error] = "oops you probably already voted"
      redirect_to question_path(@answer.question)
    end
  end

  def show

  end

  def edit
  end

  def update
  end

end
