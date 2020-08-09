Rails.application.routes.draw do
  get 'del_meets/weirdName'
  get 'del_meets/deleteMeets'
  resources :meetings

  root 'meetings#index'

  get "/veryHardToFindURLforMeetings", to: "del_meets#weirdName"

  post "/veryHardToFindURLforMeetings", to: "del_meets#deleteMeets", as: :delete_meets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
