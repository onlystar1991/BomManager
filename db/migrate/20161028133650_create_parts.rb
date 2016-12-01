class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :part_name
      t.text :part_description
      t.string :manufacturing_part
      t.string :number
      t.string :darko_part_number
      t.string :price
      t.belongs_to :firmware, foreign_key: true
      t.belongs_to :part_category, foreign_key: true

      t.timestamps
    end
  end
end
