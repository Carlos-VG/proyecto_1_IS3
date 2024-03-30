require "test_helper"

class AgenteProductosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agente_productos_index_url
    assert_response :success
  end

  test "should get show" do
    get agente_productos_show_url
    assert_response :success
  end

  test "should get new" do
    get agente_productos_new_url
    assert_response :success
  end

  test "should get edit" do
    get agente_productos_edit_url
    assert_response :success
  end

  test "should get create" do
    get agente_productos_create_url
    assert_response :success
  end

  test "should get update" do
    get agente_productos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get agente_productos_destroy_url
    assert_response :success
  end
end
