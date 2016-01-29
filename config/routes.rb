Rails.application.routes.draw do
  get 'users/new'

  get 'users/new'

  root 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'details' => 'static_pages#details'
  get 'help' => 'static_pages#help'
  get 'menu' => 'static_pages#menu'
  get 'signup'  => 'users#new'
end
