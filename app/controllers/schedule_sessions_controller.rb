class ScheduleSessionsController < ApplicationController
  before_filter :authenticate!
  respond_to :json, :html

  def index
    @mon = current_user.sessions.where(day:'mon')
    @tue = current_user.sessions.where(day:'tue')
    @wed = current_user.sessions.where(day:'wed')
    @thu = current_user.sessions.where(day:'thu')
  end
  
  def create
    unless current_user.sessions.find_by_event_and_speaker params['session']['event'], params['session']['speaker']
      session = current_user.sessions.new params['session']

      if session.save
        @message = {success: "#{session.event} was added to your calendar"}
      else
        @message = {error: "#{session.errors.full_messages.join('</br>')}"}
      end
    else
      @message = {error: "You already have this talk on your schedule"}
    end

    render json: @message
  end

  def destroy
    session = current_user.sessions.find_by_custom_id params[:id]
    if session.delete
      @messgae = {success: "Talk removed" }
    else
      @message = {error: "We have some issues removing that talk"}
    end

    render json: @message

  end

end
