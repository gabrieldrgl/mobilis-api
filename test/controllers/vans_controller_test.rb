require "test_helper"

class VansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @van = vans(:one)
  end

  test "should get index" do
    get vans_url, as: :json
    assert_response :success
  end

  test "should create van" do
    assert_difference("Van.count") do
      post vans_url, params: { van: { color: @van.color, company_id: @van.company_id, license_plate: @van.license_plate } }, as: :json
    end

    assert_response :created
  end

  test "should show van" do
    get van_url(@van), as: :json
    assert_response :success
  end

  test "should update van" do
    patch van_url(@van), params: { van: { color: @van.color, company_id: @van.company_id, license_plate: @van.license_plate } }, as: :json
    assert_response :success
  end

  test "should destroy van" do
    assert_difference("Van.count", -1) do
      delete van_url(@van), as: :json
    end

    assert_response :no_content
  end
end
