# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :group, only: %i[index new create] do
    resources :entities, only: %i[index new create]
  end

  root to: 'group#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
