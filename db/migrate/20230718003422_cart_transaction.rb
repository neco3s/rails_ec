# frozen_string_literal: true

class CartTransaction < ActiveRecord::Migration[7.0]
  def change
    # 履歴テーブル(トランザクションエンティティ)
    create_table :cart_transactions do |t|
      t.string :uid, null: false, comment: '整理券番号'
      t.references :product, null: false, foreign_key: true, comment: '商品ID'

      t.timestamps
    end
  end
end
