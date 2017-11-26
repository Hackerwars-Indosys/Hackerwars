class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
# request.env['omniauth.auth']に、OmniAuthによってHashのようにユーザーのデータが格納されている。
    $session = User.find_by(uid: user.uid)


    redirect_to user_path($session)
  end


    
end
