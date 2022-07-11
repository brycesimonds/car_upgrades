Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/cars/new', to: 'cars#new'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/cars/:car_id/upgrades', to: 'car_upgrades#index'
  get '/cars/:car_id/edit', to: 'cars#edit'

  get 'cars/:car_id/upgrades/new', to: 'car_upgrades#new'

  post '/cars/:car_id/upgrades', to: 'car_upgrades#create'
  
  post 'cars', to: 'cars#create'
  patch 'cars/:id', to: 'cars#update'

  get '/upgrades', to: 'upgrades#index'
  get '/upgrades/:id', to: 'upgrades#show'
end
