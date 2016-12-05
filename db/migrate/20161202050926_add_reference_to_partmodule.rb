class AddReferenceToPartmodule < ActiveRecord::Migration[5.0]
  def change
    add_reference :part_modules, :bom, foreign_key: true
  end
end
