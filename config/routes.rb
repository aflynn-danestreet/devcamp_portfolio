Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    # pass in path, "whenever you see portfolios/sort, I want you to do something else"
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
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
