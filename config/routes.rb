# frozen_string_literal: true

Rails.application.routes.draw do
  root 'eval_us#index'
  get 'showquestion', to: 'plays#showquestion'
  get 'testing', to: 'plays#testing'
  post '/takingtest', to: 'plays#takingtest'
  get '/head', to: 'plays#showquestion'
  get '/result', to: 'plays#result'
  get 'quiz/:test_id', to: 'creates#test'
  get '/show_quiz/:test_id', to: 'plays#show_quiz', as: :test_id
  get '/quiz', to: 'creates#quiz'
  get '/listQuestion', to: 'dashboards#listQuestion'
  get '/explore', to: 'dashboards#explore'
  get '/mylibrary', to: 'dashboards#mylibrary'
  get '/reports', to: 'dashboards#report'
  get '/profile', to: 'dashboards#profile'
  get '/savetolibrary', to: 'creates#save_library'
  get '/save', to: 'creates#add_library'
  post '/finish_quiz', to: 'creates#increase_test_id'
  get '/Question', to: 'dashboards#listQuestion'
  get 'add', to: 'dashboards#add_topic'
  post '/added', to: 'dashboards#added'
  get 'play', to: 'plays#choose'
  get '/home', to: 'eval_us#index'
  get '/register', to: 'users#register'
  post '/create', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions, only: %i[login create destroy]
  get 'login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  # match '/store' , to: 'creates#store' , via: "post"
  post '/store', to: 'creates#store'
  # post '/save', to: 'creates#random'
end
