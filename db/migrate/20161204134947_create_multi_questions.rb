class CreateMultiQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :multi_questions do |t|
      t.string :text_answer
      t.boolean :selected
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
