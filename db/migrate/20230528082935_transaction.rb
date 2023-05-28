# frozen_string_literal: true

class Transaction < ActiveRecord::Migration[7.0]
  def change
    # トランザクションテーブル(イベントエンティティ)
    create_table :purchases do |t| # 購入テーブル
      t.integer :promo_code_id, null: true, comment: 'プロモーションコードID'
      t.string :first_name, null: false, comment: '名'
      t.string :last_name, null: false, comment: '姓'
      t.string :username, null: false, comment: 'ニックネーム'
      t.string :email, null: false, comment: 'メールアドレス' # ユーザとの繋がりがメールしかないので必須入力にする(UI側も)
      t.string :address, null: false, comment: '市区町村+番地'
      t.string :address_optional, null: true, comment: '階層や部屋番号'
      t.string :country, null: false, comment: '国'
      t.string :state, null: false, comment: '都道府県'
      t.integer :zip, null: false, comment: '郵便番号'
      t.string :name_on_card, null: false, comment: 'クレジットカードの名前'
      t.integer :credit_card_number, null: false, comment: 'クレジットカードナンバー'
      t.date :expiration, null: false, comment: '有効期限'

      t.timestamps

      # 外部キー制約で各テーブル間の関連性を明らかにし、データの更新・削除時に整合性を保つ
      t.foreign_key :promo_codes unless foreign_key_exists?(:purchases, :promo_codes)

      # インデックス作成(default)と一意性制約=>シーケンシャルスキャンを防ぐ
      t.index(:email, unique: true)
    end

    create_table :purchase_details do |t| # 購入明細テーブル
      t.integer :product_id, null: false, comment: '商品ID'
      t.integer :quantity, null: false, comment: '数量'
      t.integer :unit_price, null: false, comment: '単価'
      t.integer :subtotal, null: false, comment: '小計'

      t.timestamps

      # 外部キー制約で各テーブル間の関連性を明らかにし、データの更新・削除時に整合性を保つ
      t.foreign_key :products

      # インデックス作成(default)と一意性制約=>シーケンシャルスキャンを防ぐ
      t.index(:id, unique: true)
      t.index(:product_id, unique: false)
    end

    create_table :purchase_detail_associations do |t| # 購入明細関連テーブル
      t.integer :purchase_id, null: false, comment: '購入ID'
      t.integer :purchase_detail_id, null: false, comment: '購入明細ID'

      t.timestamps

      # 外部キー制約で各テーブル間の関連性を明らかにし、データの更新・削除時に整合性を保つ
      t.foreign_key :purchases
      t.foreign_key :purchase_details

      # インデックス作成(default)と一意性制約=>シーケンシャルスキャンを防ぐ
      t.index(:purchase_id, unique: false)
      t.index(:purchase_detail_id, unique: true) # 企業->product_id->puchase_detail_id(自社商品)->puchase_id->(他社商品)
    end
  end
end
