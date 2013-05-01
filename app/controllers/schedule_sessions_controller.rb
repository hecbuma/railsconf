class ScheduleSessionsController < ApplicationController
  before_filter :authenticate!
  respond_to :json, :html

  def index
    @mon = current_user.sessions.where(day:'mon')
    @tue = current_user.sessions.where(day:'tue')
    @wed = current_user.sessions.where(day:'wed')
    @thu = current_user.sessions.where(day:'thu')

    @normal = ['11:30am-12:10pm', '12:20pm- 1:00pm', '1:00pm- 2:00pm', '2:00pm- 2:40pm', '2:50pm- 3:30pm', '3:30pm- 4:00pm', '4:00pm- 4:40pm', '4:50pm- 5:30pm', '5:45pm- 7:00pm']
    @wednesday = ['11:30am-12:10pm', '12:20pm- 1:00pm', '1:00pm- 2:00pm', '2:00pm- 2:40pm', '2:50pm- 3:30pm', '3:30pm- 4:00pm', '4:00pm- 5:30pm', '5:45pm- 6:30pm'] 
    @thursday = ['11:20am-12:00pm', '12:00pm- 2:00pm', '2:00pm- 3:30pm', '3:30pm- 4:30pm']
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
