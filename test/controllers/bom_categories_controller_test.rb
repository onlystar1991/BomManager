require 'test_helper'

class BomCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bom_category = bom_categories(:one)
  end

  test "should get index" do
    get bom_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_bom_category_url
    assert_response :success
  end

  test "should create bom_category" do
    assert_difference('BomCategory.count') do
      post bom_categories_url, params: { bom_category: { name: @bom_category.name } }
    end

    assert_redirected_to bom_category_url(BomCategory.last)
  end

  test "should show bom_category" do
    get bom_category_url(@bom_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_bom_category_url(@bom_category)
    assert_response :success
  end

  test "should update bom_category" do
    patch bom_category_url(@bom_category), params: { bom_category: { name: @bom_category.name } }
    assert_redirected_to bom_category_url(@bom_category)
  end

  test "should destroy bom_category" do
    assert_difference('BomCategory.count', -1) do
      delete bom_category_url(@bom_category)
    end

    assert_redirected_to bom_categories_url
  end
end
