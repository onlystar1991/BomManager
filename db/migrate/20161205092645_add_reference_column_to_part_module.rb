class AddReferenceColumnToPartModule < ActiveRecord::Migration[5.0]
  def change
    add_reference :part_modules, :part, foreign_key: true
  end
end
