Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    resource :profile
  end
  get 'about', to: 'pages#about'
  get 'ranking', to: 'pages#ranking'
  resources :contacts, only: :create
  resources :fighters
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
