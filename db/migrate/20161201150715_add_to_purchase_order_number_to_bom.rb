class AddToPurchaseOrderNumberToBom < ActiveRecord::Migration[5.0]
  def change
    add_column :boms, :purchase_order_number, :string
  end
end
