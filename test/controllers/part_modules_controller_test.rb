require 'test_helper'

class PartModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_module = part_modules(:one)
  end

  test "should get index" do
    get part_modules_url
    assert_response :success
  end

  test "should get new" do
    get new_part_module_url
    assert_response :success
  end

  test "should create part_module" do
    assert_difference('PartModule.count') do
      post part_modules_url, params: { part_module: { name: @part_module.name } }
    end

    assert_redirected_to part_module_url(PartModule.last)
  end

  test "should show part_module" do
    get part_module_url(@part_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_module_url(@part_module)
    assert_response :success
  end

  test "should update part_module" do
    patch part_module_url(@part_module), params: { part_module: { name: @part_module.name } }
    assert_redirected_to part_module_url(@part_module)
  end

  test "should destroy part_module" do
    assert_difference('PartModule.count', -1) do
      delete part_module_url(@part_module)
    end

    assert_redirected_to part_modules_url
  end
end
