class AdminSessionsController < ApplicationController
  def new
  end

  def create
    input_user = params[:username]
    input_pass = params[:password]

    admin_user = Rails.application.credentials.dig(:admin, :username)
    admin_pass = Rails.application.credentials.dig(:admin, :password)

    if input_user == admin_user && input_pass == admin_pass
      session[:admin] = true
      redirect_to comments_path, notice: "登录成功"
    else
      flash.now[:alert] = "用户名或密码错误"
      render :new
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to comments_path, notice: "已退出登录"
  end
end

