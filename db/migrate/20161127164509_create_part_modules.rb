class CreatePartModules < ActiveRecord::Migration[5.0]
  def change
    create_table :part_modules do |t|
      t.string :name

      t.timestamps
    end
  end
end
