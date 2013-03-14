class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
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
    @comments = @question.comments.order("created_at ASC")
  end

  def edit
  end

  def update
  end

  def comments
    @question = Question.find(params[:id])
    @comment = @question.comments.build(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to question_path(@question), notice: "comment created."}
        format.js
      else
        render 'questions/show'
      end
    end
  end

  def votes
    @question = Question.find(params[:id])
    @vote = @question.votes.build({:user_id => current_user.id})
    if @vote.save
      flash[:success] = "What a good citizen. You voted."
      redirect_to question_path(@question)
    else
      render 'question/show'
    end
  end
end
