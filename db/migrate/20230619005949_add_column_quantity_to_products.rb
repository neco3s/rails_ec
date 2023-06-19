class AddColumnQuantityToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :quantity, :integer,null: false, comment: '在庫数'
  end
end
