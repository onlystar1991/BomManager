require 'test_helper'

class QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @questionnaire = questionnaires(:one)
  end

  test "should get index" do
    get questionnaires_url
    assert_response :success
  end

  test "should get new" do
    get new_questionnaire_url
    assert_response :success
  end

  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post questionnaires_url, params: { questionnaire: { multiple_question: @questionnaire.multiple_question, select_question: @questionnaire.select_question, select_question_answer: @questionnaire.select_question_answer, text_question: @questionnaire.text_question, text_question_answer: @questionnaire.text_question_answer, type: @questionnaire.type } }
    end

    assert_redirected_to questionnaire_url(Questionnaire.last)
  end

  test "should show questionnaire" do
    get questionnaire_url(@questionnaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_questionnaire_url(@questionnaire)
    assert_response :success
  end

  test "should update questionnaire" do
    patch questionnaire_url(@questionnaire), params: { questionnaire: { multiple_question: @questionnaire.multiple_question, select_question: @questionnaire.select_question, select_question_answer: @questionnaire.select_question_answer, text_question: @questionnaire.text_question, text_question_answer: @questionnaire.text_question_answer, type: @questionnaire.type } }
    assert_redirected_to questionnaire_url(@questionnaire)
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete questionnaire_url(@questionnaire)
    end

    assert_redirected_to questionnaires_url
  end
end
