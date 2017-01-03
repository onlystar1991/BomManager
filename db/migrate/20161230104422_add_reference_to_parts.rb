class AddReferenceToParts < ActiveRecord::Migration[5.0]
  def change
    add_reference :parts, :sub_category, foreign_key: true
  end
end
