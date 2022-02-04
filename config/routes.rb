Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :campers, only: %i[index new create show]
  resources :users do
    resources :campers, only: :show do
      resources :booking_requests, only: %i[new create]
    end
    resources :booking_requests, only: %i[index]
  end
  resources :booking_requests, only: %i[show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
