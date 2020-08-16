Rails.application.routes.draw do
  resources :users
  resources :departments
  get 'del_meets/weirdName'
  get 'del_meets/deleteMeets'
  resources :meetings

  get 'sessions/new', to: "sessions#new", as: :login
  post 'sessions/new', to: "sessions#create"
  delete '/log_out', to: "sessions#log_out", as: :logout



  root 'meetings#index'

  get "/veryHardToFindURLforMeetings", to: "del_meets#weirdName"

  post "/veryHardToFindURLforMeetings", to: "del_meets#deleteMeets", as: :delete_meets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
