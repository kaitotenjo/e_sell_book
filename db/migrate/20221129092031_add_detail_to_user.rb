class AddDetailToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string , :default => "user"
    #Ex:- :default =>''
  end
end
