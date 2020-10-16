Rails.application.routes.draw do
  root to: "ideas#index"

  get    '/sign_in',   to: 'sessions#new'
  post   '/sign_in',   to: 'sessions#create'
  delete '/sign_out',  to: 'sessions#destroy'

  resources :ideas do
    member do
      patch :like
    end
  end
  resources :comments

  get 'pages/info'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
