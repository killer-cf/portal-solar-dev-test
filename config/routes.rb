Rails.application.routes.draw do
  root to: 'power_generators#index' 
  get 'search', to: 'power_generators#search'
  resources :home, only: %i[index]
end
