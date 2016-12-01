require 'test_helper'

class BomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bom = boms(:one)
  end

  test "should get index" do
    get boms_url
    assert_response :success
  end

  test "should get new" do
    get new_bom_url
    assert_response :success
  end

  test "should create bom" do
    assert_difference('Bom.count') do
      post boms_url, params: { bom: { bom_category_id: @bom.bom_category_id, description: @bom.description, name: @bom.name } }
    end

    assert_redirected_to bom_url(Bom.last)
  end

  test "should show bom" do
    get bom_url(@bom)
    assert_response :success
  end

  test "should get edit" do
    get edit_bom_url(@bom)
    assert_response :success
  end

  test "should update bom" do
    patch bom_url(@bom), params: { bom: { bom_category_id: @bom.bom_category_id, description: @bom.description, name: @bom.name } }
    assert_redirected_to bom_url(@bom)
  end

  test "should destroy bom" do
    assert_difference('Bom.count', -1) do
      delete bom_url(@bom)
    end

    assert_redirected_to boms_url
  end
end
