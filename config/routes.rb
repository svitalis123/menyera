# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create, :index, :destroy, :update] do
    resources :groups, only: [:index, :show, :create, :new, :update, :destroy]
    resources :entities, only: [:index, :show, :create, :new, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
