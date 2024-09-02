# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tasks#index'

  resources :tasks, only: %i[create destroy] do
    member do
      patch :toggle_complete
    end
  end

  get :ping, to: 'healthchecks#ping'
end
