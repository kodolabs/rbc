Rbc::Application.routes.draw do
  root :to => 'home#index'

  resources :users, :only => :create
  resources :questionaries, :only => :create
  match '/location' => 'home#location', as: :location
  match '/program' => 'home#program', as: :program
  match '/register' => 'registrations#new', as: :new_registration
  resources :registrations, only: [:new, :create] do
    collection do
      get :success
    end
  end

  namespace :admin do
    root to: 'dashboard#show'
    resource :dashboard, controller: 'dashboard'
    resources :users
    resources :registrations
  end

  if Rails.application.config.consider_all_requests_local
    get "errors/error_404"
    get "errors/error_500"
  else
    match '*not_found', to: 'errors#error_404'
  end

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end
end
