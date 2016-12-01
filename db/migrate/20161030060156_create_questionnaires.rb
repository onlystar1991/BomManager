class CreateQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires do |t|
      t.integer :type
      t.string :text_question
      t.string :text_question_answer
      t.string :select_question
      t.boolean :select_question_answer
      t.string :multiple_question

      t.timestamps
    end
  end
end
