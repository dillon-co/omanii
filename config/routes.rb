Rails.application.routes.draw do
  resources :payment_plans

  get 'price' => 'payment_plans#new', as: :price
  get 'messages' => 'messages#index', as: :messages
  get 'pages/index'
  get 'pages/home'
  get '/about' => 'pages#about', as: :about
  get '/profile' => "pages#profile", as: :profile
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations',  :omniauth_callbacks => "users/omniauth_callbacks" }

  post 'friends/create'
  get 'friends/index'

  get 'privacy_policy' => 'pages#privacy_policy', as: :privacy_policy

  namespace :api do
    namespace :v1 do
      get 'users/user_is_logged_in'
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
