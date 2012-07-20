class WorkResultCommentsController < ApplicationController
  before_filter :login_required
  before_filter :pre_load
  
  def pre_load
    @work_result = WorkResult.find(params[:work_result_id]) if params[:work_result_id]
    @comment = Comment.find(params[:id]) if params[:id]
  end
  
  def create
    @comment = @work_result.comments.build(:content => params[:comment])
    @comment.creator = current_user
    @comment.save

    render :layout => false
  end
  
  
  def reply
    @work_result = @comment.model
    reply_comment = @work_result.comments.build(:content => params[:comment])
    reply_comment.reply_comment_id = @comment.id
    reply_comment.creator = current_user
    reply_comment.save

    render :layout => false
  end


  def destroy
    @comment.destroy
    render :nothing => true
  end
end
