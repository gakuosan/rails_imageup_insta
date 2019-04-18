class SessionsController < ApplicationController
  def new
  end
  
  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user&&user.authenticate(params[:session][:password])
      session[:user_id]=user.id
      #ユーザーのブラウザ内のcookiesに暗号化されたユーザーIDが自動で生成されます。
      #ユーザー詳細ページにリダイレクト
      redirect_to user_path(user.id)
      # ログイン成功した場合
    else
      flash.now[:danger]="ログインに失敗しました"
        render "new"
    end
    
    def destroy
      session.delete(:user_id)
      flash[:notice]="ログアウトしました"
    　redirect_to new_session_path
    end
  end
end
