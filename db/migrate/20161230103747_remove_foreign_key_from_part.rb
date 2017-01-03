class RemoveForeignKeyFromPart < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :parts, column: :part_category_id
  end
end
