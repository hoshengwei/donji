Rails.application.routes.draw do
  resources :usefuls
  resources :ocean_inspects
  resources :staffs
  resources :boats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:  'ocean_inspects#index'
  resources :weathers
  resources :managements
  get 'ocean_inspects/:id/logbooks', to: 'ocean_inspects#logbooks', as: 'logbooks'
  get 'cwb', to: 'weathers#cwb', as: 'cwb'
end
