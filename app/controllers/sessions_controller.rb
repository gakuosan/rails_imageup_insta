class SessionsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def new
  end
  
  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user&&user.authenticate(params[:session][:password])
      redirect_to user_path(user.id)
      # ログイン成功した場合
      else
      flash[:danger]="ログインに失敗しました"
      render "new"
    end
  end
    
  def destroy
    session.delete(:user_id)
    flash[:notice]="ログアウトしました"
    redirect_to new_session_path 
  end
end
