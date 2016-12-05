require 'test_helper'

class MultiQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multi_question = multi_questions(:one)
  end

  test "should get index" do
    get multi_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_multi_question_url
    assert_response :success
  end

  test "should create multi_question" do
    assert_difference('MultiQuestion.count') do
      post multi_questions_url, params: { multi_question: { question_id: @multi_question.question_id, selected: @multi_question.selected, text_answer: @multi_question.text_answer } }
    end

    assert_redirected_to multi_question_url(MultiQuestion.last)
  end

  test "should show multi_question" do
    get multi_question_url(@multi_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_multi_question_url(@multi_question)
    assert_response :success
  end

  test "should update multi_question" do
    patch multi_question_url(@multi_question), params: { multi_question: { question_id: @multi_question.question_id, selected: @multi_question.selected, text_answer: @multi_question.text_answer } }
    assert_redirected_to multi_question_url(@multi_question)
  end

  test "should destroy multi_question" do
    assert_difference('MultiQuestion.count', -1) do
      delete multi_question_url(@multi_question)
    end

    assert_redirected_to multi_questions_url
  end
end
