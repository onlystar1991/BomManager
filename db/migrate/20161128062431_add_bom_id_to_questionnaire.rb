class AddBomIdToQuestionnaire < ActiveRecord::Migration[5.0]
  def change
    add_column :questionnaires, :bom_id, :integer
  end
end
