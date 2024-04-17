require "test_helper"

class DriversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver = drivers(:one)
  end

  test "should get index" do
    get drivers_url, as: :json
    assert_response :success
  end

  test "should create driver" do
    assert_difference("Driver.count") do
      post drivers_url, params: { driver: { company_id: @driver.company_id, drivers_license: @driver.drivers_license, person_id: @driver.person_id, van_id: @driver.van_id } }, as: :json
    end

    assert_response :created
  end

  test "should show driver" do
    get driver_url(@driver), as: :json
    assert_response :success
  end

  test "should update driver" do
    patch driver_url(@driver), params: { driver: { company_id: @driver.company_id, drivers_license: @driver.drivers_license, person_id: @driver.person_id, van_id: @driver.van_id } }, as: :json
    assert_response :success
  end

  test "should destroy driver" do
    assert_difference("Driver.count", -1) do
      delete driver_url(@driver), as: :json
    end

    assert_response :no_content
  end
end
