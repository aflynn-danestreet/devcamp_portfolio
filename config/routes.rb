Rails.application.routes.draw do
  resources :portfolios, except: [:show] #I want you on all resources cept show
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show' # line 6 in portfolio/index.html.erb
  get 'about-me', to: 'pages#about'
  # you can pass anything after the CRUD action, this is customization
  get 'contact', to: 'pages#contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  root to: 'pages#home' #this sets the opening route to pages home in controller
end
