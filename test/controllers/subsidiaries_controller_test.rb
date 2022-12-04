require "test_helper"

class SubsidiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subsidiary = subsidiaries(:one)
  end

  test "should get index" do
    get subsidiaries_url
    assert_response :success
  end

  test "should get new" do
    get new_subsidiary_url
    assert_response :success
  end

  test "should create subsidiary" do
    assert_difference("Subsidiary.count") do
      post subsidiaries_url, params: { subsidiary: { address: @subsidiary.address, name: @subsidiary.name, phone_number: @subsidiary.phone_number } }
    end

    assert_redirected_to subsidiary_url(Subsidiary.last)
  end

  test "should show subsidiary" do
    get subsidiary_url(@subsidiary)
    assert_response :success
  end

  test "should get edit" do
    get edit_subsidiary_url(@subsidiary)
    assert_response :success
  end

  test "should update subsidiary" do
    patch subsidiary_url(@subsidiary), params: { subsidiary: { address: @subsidiary.address, name: @subsidiary.name, phone_number: @subsidiary.phone_number } }
    assert_redirected_to subsidiary_url(@subsidiary)
  end

  test "should destroy subsidiary" do
    assert_difference("Subsidiary.count", -1) do
      delete subsidiary_url(@subsidiary)
    end

    assert_redirected_to subsidiaries_url
  end
end
