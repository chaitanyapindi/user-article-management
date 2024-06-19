Rails.application.routes.draw do
  get 'dashboard/index'

  resources :articles do
  	resources :comments
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'articles#index'
end
