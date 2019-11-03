Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/home'
  get '/about' => 'pages#about', as: :about 
  get '/profile' => "pages#profile", as: :profile
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}

  post 'friends/create'
  get 'friends/index'

  namespace :api do
    namespace :v1 do
      get 'users/user_is_logged_in'
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
