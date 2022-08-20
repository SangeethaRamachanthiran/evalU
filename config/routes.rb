# frozen_string_literal: true

Rails.application.routes.draw do
  get 'plays/showquiz'
  root 'eval_us#index'
  get 'users_profile/edit', to: 'dashboards#edit', as: 'edit_profile'
  get '/edit/:id', to: 'dashboards#update'
  get '/edit_code/:id', to: 'dashboards#edit_code'
  get '/code/:id', to: 'dashboards#update_code'
  get 'showquestion', to: 'plays#showquestion'
  get 'testing', to: 'plays#testing'
  post '/takingtest', to: 'plays#takingtest'
  get '/test_code', to: 'plays#showquestion'
  get '/result', to: 'plays#result'
  get 'quiz/:test_id', to: 'creates#test'
  get '/show_quiz/:test_id', to: 'plays#showquiz', as: :test_id
  get '/show_quiz', to: 'plays#showquiz'
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
  get 'plays/showquestion'
  resources :users
  resources :sessions, only: %i[login create destroy]
  get 'login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  # match '/store' , to: 'creates#store' , via: "post"
  post '/store', to: 'creates#store'
  # post '/save', to: 'creates#random'
end
