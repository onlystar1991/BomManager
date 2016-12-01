class CreateBoms < ActiveRecord::Migration[5.0]
  def change
    create_table :boms do |t|
      t.string :name
      t.string :description
      t.references :bom_category, foreign_key: true

      t.timestamps
    end
  end
end
