require "test_helper"

class PedidosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pedidos_index_url
    assert_response :success
  end

  test "should get show" do
    get pedidos_show_url
    assert_response :success
  end

  test "should get new" do
    get pedidos_new_url
    assert_response :success
  end

  test "should get edit" do
    get pedidos_edit_url
    assert_response :success
  end

  test "should get create" do
    get pedidos_create_url
    assert_response :success
  end

  test "should get update" do
    get pedidos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pedidos_destroy_url
    assert_response :success
  end
end
