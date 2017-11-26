class SessionsController < ApplicationController
  skip_before_action :require_login

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
# request.env['omniauth.auth']に、OmniAuthによってHashのようにユーザーのデータが格納されている。
    session[:user_id] = user.uid
    redirect_to '/users', notice: 'ログインしました'
  end
end
