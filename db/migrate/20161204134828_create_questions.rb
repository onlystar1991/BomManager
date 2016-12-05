class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :type
      t.string :text_answer
      t.boolean :choice_answer
      t.references :bom, foreign_key: true

      t.timestamps
    end
  end
end
