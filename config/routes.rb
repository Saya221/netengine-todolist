# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tasks#index'

  resources :tasks, except: %i[index show] do
    member do
      patch :toggle_complete
    end
  end
end
