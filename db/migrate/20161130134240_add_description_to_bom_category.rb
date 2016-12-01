class AddDescriptionToBomCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :bom_categories, :description, :string
  end
end
