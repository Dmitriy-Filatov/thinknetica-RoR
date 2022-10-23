Rails.application.routes.draw do

  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  get 'sessions/new'
  get 'users/new'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
