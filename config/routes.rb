# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

  devise_for :users

  resources 'users', only: %w[index show] do
    resources 'posts', only: %w[index show new]
  end
  resources :posts, only: [:new, :create, :destroy] do
    resources :comments
    resources :likes
  end

end
