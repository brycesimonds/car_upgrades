Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/upgrades', to: 'upgrades#index'
end
