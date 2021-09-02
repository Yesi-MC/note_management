Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  resources :users, only: [:new]
    get '/users/:id/dashboard', to: 'users/dashboard#index', as: :dashboard
    get '/users/:id/note/new', to: 'users/notes#new', as: :new_user_note
    post '/users/:id/note/new', to: 'users/notes#create'
    get '/users/:id/note/:id', to: 'users/notes#show' , as: :notes_show
    get '/users/:id/note/:id/edit', to: 'users/notes#edit'
end
