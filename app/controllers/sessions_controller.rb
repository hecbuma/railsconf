class SessionsController < ApplicationController

  before_filter :avoid_logged_in_user_to_sign_in, :except => :destroy

  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to dashboard_index_url, :notice => "Signed in!"
  end

  def destroy
    session.clear
    redirect_to root_url, :notice => "Signed out!"
  end

  private
    def avoid_logged_in_user_to_sign_in
      if current_user
        redirect_to schedule_sessions_path, alert: "You have already logged in"
      end
    end
end
