Rails.application.routes.draw do
  root to: "favorites#index"

  resources :pictures do
    collection do
    post :confirm
    end
  end
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources:sessions,only: [:new, :create, :destroy]
  resources:users,only:[:new, :create, :show]
  resources:favorites,only:[:index, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
