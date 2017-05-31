Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :show, :edit, :update ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams do
    resources :members, only: [ :create ]
  end
  resources :members, except: [ :new, :create ]

  resources :teams do
    resources :tasks, only: [ :new, :create ]
  end
  resources :tasks, except: [ :new, :create ] do
    member do
      get 'done', to: 'tasks#mark_as_done'
    end
  end

  mount Attachinary::Engine => "/attachinary"
end
