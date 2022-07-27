Rails.application.routes.draw do

  get 'topics', to: 'plays#topics'
  get 'play', to: 'plays#choose'
  get '/quiz', to: 'creates#quiz'
  get '/fill_up', to: 'creates#fill_up'
  get '/trueOrFalse', to: 'creates#true_or_false'
  get '/home', to: 'eval_us#index'
  get '/register', to: 'users#register'
  post '/create', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions, only: [:login, :create, :destroy]
  get 'login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
match '/store' , to: 'creates#store' , via: "post"

end
