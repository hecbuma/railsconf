class DashboardController < ApplicationController
  def index
    @full_schedule = Rails.cache.read(:full_schedule)
  end
end
