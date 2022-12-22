class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :address_detail
      t.string :N_A
      t.string :postal
      t.string :city
      t.string :phone
      t.timestamps
    end
  end
end
