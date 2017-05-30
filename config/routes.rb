Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams do
    resources :members, only: [ :create ]
  end
  resources :members, except: [ :new, :create ]

  resources :teams do
    resources :tasks, only: [ :new, :create ]
  end
  mount Attachinary::Engine => "/attachinary"
end
