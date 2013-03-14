class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    puts params[:question].inspect
    @question = current_user.questions.build(params[:question])
    if @question.save
      flash[:success] = "question added!"
      redirect_to(question_path(@question))
    else
      flash[:error] = "question not added"
      render :new
    end
  end


  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
    @comment = Comment.new
    @vote = Vote.new
  end

  def edit
  end

  def update
  end

  def comments
    @question = Question.find(params[:id])
    @comment = @question.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "You commented. You're ridiculous"
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def votes
    @question = question.find(params[:id])
    @vote = @answer.votes.build({:user_id => current_user.id})
    if @vote.save
      flash[:success] = "What a good citizen. You voted."
      redirect_to question_path(@answer.question)
    else
      @question = @answer.question
      render 'question/show'
    end
  end
end
