Rails.application.routes.draw do
  devise_for :users
  resources :entries
  resources :entries do
  	member do
  		get 'good_entry'
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'entries#new'
end
