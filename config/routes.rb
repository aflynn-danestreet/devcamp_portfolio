Rails.application.routes.draw do
  resources :portfolios
  get 'about', to: 'pages#about'
  # you can pass anything after the CRUD action, this is customization
  get 'contact', to: 'pages#contact'
  resources :blogs
  root to: 'pages#home' #this sets the opening route to pages home in controller
end
