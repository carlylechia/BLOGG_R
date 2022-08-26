# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => {:format => :json} do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new]
    end
    resources :posts, only: [:new, :create, :destroy] do
      resources :comments
      resources :likes
    end
  end

  root 'users#index'

  # devise
  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  resources 'users', only: %w[index show] do
    resources 'posts', only: %w[index show new]
  end
  resources :posts, only: [:new, :create, :destroy] do
    resources :comments
    resources :likes
  end
end
