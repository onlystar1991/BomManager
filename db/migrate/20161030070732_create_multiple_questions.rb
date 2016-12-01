class CreateMultipleQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :multiple_questions do |t|
      t.string :question_text
      t.boolean :checked
      t.belongs_to :questionnaire, foreign_key: true

      t.timestamps
    end
  end
end
