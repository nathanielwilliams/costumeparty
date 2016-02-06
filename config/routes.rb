Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'users/new'

  root 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'details' => 'static_pages#details'
  get 'help' => 'static_pages#help'
  get 'menu' => 'static_pages#menu'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
end
