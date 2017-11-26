class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def user_logged_in?
    if $session[:user_id]
      begin
        @current_user = User.find_by(uid: $session[:user_id])
      rescue ActiveRecord::RecordNotFound
        reset_user_session
      end
    end
    return if @current_user
    # @current_userが取得できなかった場合はログイン画面にリダイレクト
    flash[:referer] = request.fullpath
    redirect_to login_users_url
  end
  
  def reset_user_session
    $session[:user_id] = nil
    @current_user = nil
  end

end
