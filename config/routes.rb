# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: 'users#index'
  resources 'users', only: %w[index show] do
    resources 'posts', only: %w[index show new create]
  end
  resources :posts, only: [:new, :create] do
    resources :comments
    resources :likes
  end
    # # dev mailer
    # if Rails.env.development?
    #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
    # end
end
