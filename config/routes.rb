# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  namespace :admin do
    get "species", to: "species#index", as: "species_index"
    get "species/new", to: "species#new", as: "species_new"
    post "species", to: "species#create", as: "species_create"
  end
end
