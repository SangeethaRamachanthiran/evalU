Rails.application.routes.draw do
  get '/explore', to: 'dashboards#explore'
  get '/mylibrary', to: 'dashboards#mylibrary'
  get '/reports', to: 'dashboards#report'
  get '/profile', to: 'dashboards#profile'
  get '/Question', to: 'dashboards#listQuestion'
  get 'add', to: 'plays#add_topic'
  post '/added', to: 'plays#added'
  get '/topics', to: 'plays#topics'
  get 'play', to: 'plays#choose'
  get '/quiz', to: 'creates#quiz'
  get '/fill_up', to: 'creates#fillup'
  get '/trueOrFalse', to: 'creates#true_or_false'
  get '/home', to: 'eval_us#index'
  get '/register', to: 'users#register'
  post '/create', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions, only: [:login, :create, :destroy]
  get 'login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
# match '/store' , to: 'creates#store' , via: "post"
  post '/store', to: 'creates#store'
  # post '/save', to: 'creates#random'

end
