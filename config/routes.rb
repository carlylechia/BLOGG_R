# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'pages#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
end
