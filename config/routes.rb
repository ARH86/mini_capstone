Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do

    get '/carted_products' => 'carted_products#index'
    post '/carted_products' => 'carted_products#create'
    patch '/carted_products' => 'carted_product#update'
    delete '/carted_products/:id' => 'carted_products#destroy'

    post '/orders' => 'orders#create'
    get '/orders' => 'orders#index'

    post "/sessions" => 'sessions#create'

    post "/users" => "users#create"
    
    get "/products" => 'products#index'
    get "/products/:id" => 'products#show'
    post "/products" => 'products#create'
    patch "/products/:id" => 'products#update'
    delete "/products/:id" => 'products#destroy'
  end
end