class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to schedule_sessions_path()
    end
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth["provider"], :uid => auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to dashboard_index_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
