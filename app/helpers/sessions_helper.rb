module SessionsHelper
# 渡されたユーザーでログインする
  def logged_in_user
    @user=current_user
    session[:user_id] = user.id                                           
  end
  # 現在ログイン中のユーザーを返す(いる場合)
  def current_user
    if session[:user_id]                                                        
      @current_user ||= User.find_by(id: session[:user_id])   
    end
  end

  def logged_in?
    current_user.present?
  end
end