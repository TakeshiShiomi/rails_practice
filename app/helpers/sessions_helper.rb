module SessionsHelper
    # 渡されたユーザーでログインする
  def log_in(account)
    session[:account_id] = account.id
  end

  # 現在ログイン中のユーザーを返す（いる場合）
  def current_account
    if session[:account_id]
      @current_account ||= Account.find_by(id: session[:account_id]) #@current_account = @current_account || account.find_by(id: session[:account_id])と同義
    end
  end

      # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_account.nil?
  end
  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:account_id)
    @current_account = nil
  end
end
