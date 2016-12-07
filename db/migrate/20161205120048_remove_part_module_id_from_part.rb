class RemovePartModuleIdFromPart < ActiveRecord::Migration[5.0]
  def change
  	remove_column :parts, :part_module_id
  end
end
