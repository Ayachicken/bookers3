Rails.application.routes.draw do
  devise_for :users
  devise_scope :users do
  	get 'users/sign_out', to:"devise/session#destroy"
  end
  get '/top' => 'users#top'
  root 'users#top'
  resources :users, only: [:index, :show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
