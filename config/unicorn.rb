worker_processes 2 # amount of unicorn workers to spin up
timeout 30         # restarts workers that hang for 30 seconds
preload_app true

before_fork do |server, worker|
  if defined? ActiveRecord::Base
    ActiveRecord::Base.connection.disconnect!
  end
end

after_fork do |server, worker|
  if defined? ActiveRecord::Base
    ActiveRecord::Base.establish_connection
  end
end
