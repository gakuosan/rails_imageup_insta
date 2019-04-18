Rails.application.routes.draw do
  resources :pictures
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources:sessions,only: [:new, :create, :destroy]
  resources:users,only:[:new, :create, :show]
  
end
