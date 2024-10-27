class TrainCommentsController < ApplicationController
  def create
    train = Train.find(params[:train_id])
    comment = current_user.train_comments.new(train_comment_params)
    comment.train_id = train.id
    comment.save
    redirect_to request.referer
  end
  
  def destroy
    comment = TrainComment.find(params[:id])
    comment.destroy
  end
  
  private
  
  def train_comment_params
    params.require(:train_comment).permit(:comment)
  end

end