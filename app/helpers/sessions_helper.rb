module SessionsHelper
  
  # 一時セッションスコープ（ユーザーのブラウザ内の一時cookies）
  #  にハッシュ化したuser.idを保存
  def log_in(user)
    # rails の sessionメソッド
    session[:user_id] = user.id
  end
  
  # 現在ログイン中のユーザーを返す（いる場合）
  def current_user
    if session[:user_id]
      @current_user = @current_user || User.find_by(id: session[:user_id])
    end
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
