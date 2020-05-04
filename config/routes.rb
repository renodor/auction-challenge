Rails.application.routes.draw do
  root to: 'auctions#index'
  resources :auctions do
    member do
      patch :bid
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
