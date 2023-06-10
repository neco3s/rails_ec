# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# == Route Map
# --[ Route 1 ]--------------------------------------------------------------------------------------------------------------------------------------------------
# Prefix            | products
# URI               | /products(.:format)
# Controller#Action | products#index
# --[ Route 2 ]--------------------------------------------------------------------------------------------------------------------------------------------------
# URI               | /products/:id(.:format)
# Controller#Action | products#show

# rubocop:enable Layout/LineLength
Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: %i[index show]
end
