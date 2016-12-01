class AddCountToPartModule < ActiveRecord::Migration[5.0]
  def change
    add_column :part_modules, :count, :integer
  end
end
