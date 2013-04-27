class Session < ActiveRecord::Base
  attr_accessible :day, :event, :event_type, :room, :speaker, :time, :user_id, :custom_id
end
