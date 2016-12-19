class AddPricesToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :price_250, :float
    add_column :parts, :price_500, :float
    add_column :parts, :price_1000, :float
    add_column :parts, :price_2500, :float
    add_column :parts, :price_5000, :float
  end
end
