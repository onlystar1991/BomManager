require 'test_helper'

class FirmwaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @firmware = firmwares(:one)
  end

  test "should get index" do
    get firmwares_url
    assert_response :success
  end

  test "should get new" do
    get new_firmware_url
    assert_response :success
  end

  test "should create firmware" do
    assert_difference('Firmware.count') do
      post firmwares_url, params: { firmware: { description: @firmware.description, number: @firmware.number, publish_date: @firmware.publish_date } }
    end

    assert_redirected_to firmware_url(Firmware.last)
  end

  test "should show firmware" do
    get firmware_url(@firmware)
    assert_response :success
  end

  test "should get edit" do
    get edit_firmware_url(@firmware)
    assert_response :success
  end

  test "should update firmware" do
    patch firmware_url(@firmware), params: { firmware: { description: @firmware.description, number: @firmware.number, publish_date: @firmware.publish_date } }
    assert_redirected_to firmware_url(@firmware)
  end

  test "should destroy firmware" do
    assert_difference('Firmware.count', -1) do
      delete firmware_url(@firmware)
    end

    assert_redirected_to firmwares_url
  end
end
