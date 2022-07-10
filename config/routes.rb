Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/cars/new', to: 'cars#new'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/cars/:car_id/upgrades', to: 'car_upgrades#index'


  get '/upgrades', to: 'upgrades#index'
  get '/upgrades/:id', to: 'upgrades#show'
end
