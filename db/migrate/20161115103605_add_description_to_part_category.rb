class AddDescriptionToPartCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :part_categories, :description, :text
  end
end
