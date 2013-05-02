class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
  def current_user
    @current_user ||= User.where(:id => session[:user_id]).first
  end

  def authenticate!
    unless current_user
      flash[:notice] = 'You have to be logged in' 
      redirect_to root_url
    end
  end
end
