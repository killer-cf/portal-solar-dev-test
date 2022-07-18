Rails.application.routes.draw do
  root to: 'power_generators#index'

  resources :power_generators, only: :show  do
    collection do
      get 'search'
      get 'filter_price'
      get 'filter_kwp'
      get 'advanced_search'
    end   
    get 'freight_value', on: :member 
  end

  namespace :api do
    namespace :v1 do
      resources :power_generators, only: %i[show index]
    end
  end
end
