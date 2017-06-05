Rails.application.routes.draw do
  root to: 'pages#home'

  get "/dashboards", to: "users#dashboards", as: :dashboards

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [ :index, :show, :edit, :update ]

  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams do
    resources :tasks, only: [ :new, :create ]
    resources :members, only: [ :new, :create ]
    member do
      get "dashboard", to: "teams#dashboard"
    end
  end

  resources :members, except: [ :new, :create ] do
    resources :reviews, only: [ :new, :create ]
  end


  resources :tasks, except: [ :new, :create ] do
    member do
      get 'done', to: 'tasks#mark_as_done'
    end
  end


  mount Attachinary::Engine => "/attachinary"
  mount Commontator::Engine => '/commontator'
end
