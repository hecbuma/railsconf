RailsconfApp::Application.routes.draw do
  root :to => "sessions#new"
  
  match "/auth/:provider/callback" => "sessions#create"

  resources :dashboard
  resources :schedule_sessions, path: 'my_schedule'

  match "/signout" => "sessions#destroy", :as => :signout
end
