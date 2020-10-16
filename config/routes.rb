Rails.application.routes.draw do
  get 'sessions/new'
  root to: "ideas#index"

  resources :ideas do
    member do
      patch :like
    end
  end
  resources :comments

  get 'pages/info'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
