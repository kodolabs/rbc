Rbc::Application.routes.draw do
  root :to => 'home#index'

  resources :users, :only => :create
  resources :questionaries, :only => :create
end
