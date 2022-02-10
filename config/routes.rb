Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/campers', to: 'pages#campers'
  resources :campers, only: %i[show edit update destroy]
  resources :users do
    resources :campers, only: %i[index show new create] do
      resources :booking_requests, only: %i[new create] do
        collection do
          post :confirm
        end
      end
    end
    resources :booking_requests, only: %i[index show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
