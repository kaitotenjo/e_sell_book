class AddTopSellingToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :top_selling, :float , :default => 0.0
    #Ex:- :default =>''
  end
end
