Rails.application.routes.draw do
  root to: 'power_generators#index' 
  get 'search', to: 'power_generators#search'
  get 'filter_price', to: 'power_generators#filter_price'
  get 'filter_kwp', to: 'power_generators#filter_kwp'
  get 'advanced_search', to: 'power_generators#advanced_search'
  resources :home, only: %i[index]
end
