Stack::Application.routes.draw do
  match '/auth/logout' => 'sessions#destroy'
  match '/auth/:provider/callback' => 'sessions#create'
  match '/users/:user' => 'users#show'
  match '/signin' => 'sessions#signin'

  resources :logs
  resources :sessions
  resources :homes
  root :to => "homes#index"
end
