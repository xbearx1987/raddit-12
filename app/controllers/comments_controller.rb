class CommentsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]


  def new
    @link = Link.find(params[:id])
    @comment = Comment.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.link = @link

    if @comment.save!
      redirect_to :back
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
