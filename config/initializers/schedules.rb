full_schedule = {}

partials = { mon: 'schedule1', tus: "schedule2", wed: "schedule3",  thu: "schedule4", talks: 'talks' }

partials.map do |k, v|
  full_schedule[k] = JSON.parse(File.read("#{Rails.root}/public/railsconf-output/#{v}.json"))
end

Rails.cache.write :full_schedule, full_schedule
