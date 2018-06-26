module SessionsHelper
  
  # 渡されたユーザでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # 現在ログイン中のユーザを返却する
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # ユーザがログインしていればtrue
  def logged_in?
    !current_user.nil?
  end
  
  # 現在のユーザをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
