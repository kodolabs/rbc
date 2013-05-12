Rbc::Application.routes.draw do
  root :to => 'home#index'

  resources :users, :only => :create
  resources :questionaries, :only => :create

  namespace :admin do
    resource :dashboard, controller: 'dashboard'
  end

  if Rails.application.config.consider_all_requests_local
    get "errors/error_404"
    get "errors/error_500"
  else
    match '*not_found', to: 'errors#error_404'
  end
end
