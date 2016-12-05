json.extract! multi_question, :id, :text_answer, :selected, :question_id, :created_at, :updated_at
json.url multi_question_url(multi_question, format: :json)