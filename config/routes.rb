require 'api_constraints'
Rails.application.routes.draw do
  
  resources :practices
  devise_for :users
  namespace :api do
   scope module: :v1,constraints: ApiConstraints.new(version: 1) do
    resources :bviews do
	   resources :comments
	end
   end
   
   scope module: :v2,constraints: ApiConstraints.new(version: 2,default: true)do
    resources :bviews do
	   resources :comments
	end
   end
   
  end

  
  get 'formprac/index'

  get 'formprac/new'
  get 'formprac/create'
  post 'formprac/accept', to: 'formprac#accept'

  resources :bviews do
	resources:comments
  end
  
  get 'home/index'
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
