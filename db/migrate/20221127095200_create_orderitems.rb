class CreateOrderitems < ActiveRecord::Migration[7.0]
  def change
    create_table :orderitems do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :until_price
      t.decimal :total, default: 0
      t.timestamps
    end
  end
end
