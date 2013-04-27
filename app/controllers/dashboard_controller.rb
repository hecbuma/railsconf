class DashboardController < ApplicationController
  def index
    mon =  File.read(File.join(Rails.root, "/public/railsconf-output/schedule1.json"))
    tus =  File.read(File.join(Rails.root, "/public/railsconf-output/schedule2.json"))
    wed =  File.read(File.join(Rails.root, "/public/railsconf-output/schedule3.json"))
    thu =  File.read(File.join(Rails.root, "/public/railsconf-output/schedule4.json"))

    mon = ActiveSupport::JSON.decode(mon)
    tus = ActiveSupport::JSON.decode(tus)
    wed = ActiveSupport::JSON.decode(wed)
    thu = ActiveSupport::JSON.decode(thu)

    @full_schedule = {mon: mon, tus: tus, wed: wed, thu: thu }
  end
end
