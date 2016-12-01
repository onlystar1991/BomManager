class CreateFirmwares < ActiveRecord::Migration[5.0]
  def change
    create_table :firmwares do |t|
      t.string :number
      t.text :description
      t.datetime :publish_date

      t.timestamps
    end
  end
end
