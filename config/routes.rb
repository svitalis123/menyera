# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  root to: "splash#see"
  resources :splash
  resources :users, only: [:show, :new, :create, :index, :destroy, :update] do
    resources :groups, only: [:index, :show, :create, :new, :update, :destroy] do
      resources :entities, only: [:index, :show, :create, :new, :update, :destroy]
    end
  end
  resources :entity_groups, only: [:create, :new]
  # get "splash", to: "splash#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 
end
