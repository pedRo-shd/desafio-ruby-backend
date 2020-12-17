Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'financial_transactions/lists#index'
  
  namespace :financial_transactions do
    get '/imports/new', to: 'imports#new'
    post '/imports', to: 'imports#create'
    get '/lists', to: 'lists#index'
    get '/lists/:store_id/account_balance', to: 'lists#show'
  end
end
