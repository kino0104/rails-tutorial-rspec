module SessionsHelper
  
  # 渡されたユーザでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # ユーザのセッションを永続的にする
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # 現在ログイン中のユーザを返却する
  def current_user
    if(user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif(user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        @current_user = user
      end
    end
  end
  
  # ユーザがログインしていればtrue
  def logged_in?
    !current_user.nil?
  end
  
  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  # 現在のユーザをログアウトする
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
