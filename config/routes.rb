# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'users#index'
  resources 'users', only: %w[index show] do
    resources 'posts', only: %w[index show]
  end
end
