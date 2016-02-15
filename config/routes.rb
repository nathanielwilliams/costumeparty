Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

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

  resources :wrestlers,           only: [:index, :new, :show, :create, :edit, :update, :destroy]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
end
