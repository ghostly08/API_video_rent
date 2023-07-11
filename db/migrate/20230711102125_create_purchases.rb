class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :price
      t.string :quality
      t.datetime :purchased_at
      t.string :content_type
      t.integer :content_id

      t.timestamps
    end
  end
end
