class AddPartModuleIdToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :part_module_id, :integer
  end
end
