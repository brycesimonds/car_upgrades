Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/cars/new', to: 'cars#new'
  get '/cars', to: 'cars#index'
  delete '/cars', to: 'cars#delete'
  get '/cars/:id', to: 'cars#show'
  get '/cars/:id/edit', to: 'cars#edit'
  post '/cars', to: 'cars#create'
  patch '/cars/:id', to: 'cars#update'
  delete 'cars/:id', to: 'cars#delete'

  get '/cars/:car_id/upgrades?number=:number', to: 'car_upgrades#index'
  get '/cars/:car_id/upgrades?sort=activated', to: 'car_upgrades#index'
  get '/cars/:car_id/upgrades', to: 'car_upgrades#index'
  get '/cars/:car_id/upgrades/new', to: 'car_upgrades#new'
  post '/cars/:car_id/upgrades', to: 'car_upgrades#create'
  
  get "/upgrades/:id/edit", to: 'upgrades#edit'
  get '/upgrades', to: 'upgrades#index'
  patch '/upgrades/:id', to: 'upgrades#update'
  get '/upgrades/:id', to: 'upgrades#show'
  delete 'upgrades/:id', to: 'upgrades#delete'
end

