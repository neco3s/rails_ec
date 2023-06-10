# frozen_string_literal: true

# == Route Map
# --[ Route 1 ]--------------------------------------------------------------------------------------------------------------------------------------------------
# Prefix            | products
# URI               | /products(.:format)
# Controller#Action | products#index
# --[ Route 2 ]--------------------------------------------------------------------------------------------------------------------------------------------------
# URI               | /products/:id(.:format)
# Controller#Action | products#show

Rails.application.routes.draw do
  resources :products, only: %i[index show]
end
