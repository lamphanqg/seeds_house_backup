# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  namespace :admin do
    get "species/new", to: "species#new", as: "species_new"
    get "species/edit/:id", to: "species#edit", as: "species_edit"
    post "species", to: "species#create", as: "species_create"
  end

  get "species", to: "species#index", as: "species_index"
end
