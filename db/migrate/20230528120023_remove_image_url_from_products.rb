# frozen_string_literal: true

class RemoveImageUrlFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :image_url, :string
  end
end
