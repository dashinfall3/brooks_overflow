class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @commentable
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "comment added!"
      redirect_to(question_path(@comment.commentable))
    else

    end
  end

end
