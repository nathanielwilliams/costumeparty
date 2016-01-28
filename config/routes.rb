Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/contact'
  get 'static_pages/details'
  get 'static_pages/help'
  get 'static_pages/menu'
end
