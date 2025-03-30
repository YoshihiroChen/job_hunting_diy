class CommentsController < ApplicationController
  def index
    @comments = Comment.order(created_at: :desc)
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path, notice: "コメントが投稿されました。"
    else
      @comments = Comment.order(created_at: :desc)
      render :index, alert: "コメントを投稿できませんでした。"
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
