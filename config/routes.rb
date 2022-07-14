Rails.application.routes.draw do
  # get '/login', to: 'sessions#login'
  # get '/login', to: 'sessions#create'
  # get '/login', to: 'sessions#destroy'

  get '/quiz', to: 'creates#quiz'
  get '/true-or-false', to: 'creates#true_or_false'
  get '/fill-up', to: 'creates#fill_up'

  get '/home', to: 'eval_us#index'
  # root 'eval_us/index'
  get '/register', to: 'users#register', as: 'register'
  post '/register', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions, only: [:login, :create, :destroy]
  get 'login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'


end
