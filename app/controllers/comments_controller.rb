class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @comments = Comment.order(created_at: :desc).page(params[:page]).per(25)  # 每页5条
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path, notice: "评论成功！"
    else
      @comments = Comment.order(created_at: :desc).page(params[:page]).per(25)
      flash.now[:alert] = "评论失败。"
      render :index
    end
  end

  def destroy
    unless session[:admin] == true
      redirect_to comments_path, alert: "无权限进行操作"
      return
    end

    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path, notice: "评论已删除"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
