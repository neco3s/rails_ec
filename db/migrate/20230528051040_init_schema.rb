# frozen_string_literal: true

class InitSchema < ActiveRecord::Migration[7.0]
  def change
    # マスターテーブル(リソースエンティティ)
    create_table :products do |t| # 商品テーブル
      t.string :name, null: false, comment: '商品名'
      t.string :code, null: false, comment: '商品コード'
      t.text :description, null: false, comment: '商品説明'
      t.integer :price, null: false, comment: '価格'

      t.timestamps

      # インデックス作成(default)と一意性制約=>シーケンシャルスキャンを防ぐ
      t.index(:id, unique: true)
      t.index(:code, unique: true)
    end
  end
end
