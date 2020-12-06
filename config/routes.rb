Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
    root to: 'application#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_in', to: 'devise/sessions#new'
    post '/users/sign_in', to: 'devise/sessions#create'
    get '/users/sign_up', to: 'devise/sessions#new'
    post '/users/sign_up', to: 'devise/sessions#create'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  get '/users/:id', to: 'users#show'

  get ':not_found' => redirect('/'), :constraints => { :not_found => /.*/ }
end
