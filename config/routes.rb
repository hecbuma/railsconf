RailsconfApp::Application.routes.draw do
  root :to => "sessions#new"
  
  match "/auth/:provider/callback" => "sessions#create"

  resources :dashboard
end
