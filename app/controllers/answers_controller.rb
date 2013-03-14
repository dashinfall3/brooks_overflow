class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(params[:answer])
    respond_to do |format|
      if @answer.save
        @vote = Vote.new
        @comment = Comment.new
        @question = @answer.question
        format.js
      else
        flash[:error] = "yo  your answer no worky"
        @question = @answer.question
        render 'questions/show'
      end
    end
  end

  # post '/comments' do
  #   @comments = Comment.find(params[])
  # end

  def comments 
    @answer = Answer.find(params[:id])
    @comment = @answer.comments.build(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to question_path(@answer.question), :notice=> "You comment on that answer"}
        format.js
      else
        flash[:error] = "you no comment on dat answer"
        @question = @answer.question
        render 'questions/show'
      end
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

  def declare_winner
    @answer = Answer.find(params[:id])
    respond_to do |format|
      if @answer.question.has_winner?
        flash.now["you already declared a winner silly goose"]
      else
        @answer.winner = true
        @answer.save
        format.js
      end
    end
  end

  def show

  end

  def edit
  end

  def update
  end

end
