json.extract! question, :id, :question, :type, :text_answer, :choice_answer, :bom_id, :created_at, :updated_at
json.url question_url(question, format: :json)