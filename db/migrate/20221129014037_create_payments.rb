class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|\
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :card_number 
      t.string :MM_YY
      t.string :code
      t.string :name_card
      
      t.timestamps
    end
  end
end
