class CreateBomCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :bom_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
