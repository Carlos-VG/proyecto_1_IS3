require "test_helper"

class PedidoProductosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pedido_productos_index_url
    assert_response :success
  end

  test "should get show" do
    get pedido_productos_show_url
    assert_response :success
  end

  test "should get new" do
    get pedido_productos_new_url
    assert_response :success
  end

  test "should get edit" do
    get pedido_productos_edit_url
    assert_response :success
  end

  test "should get create" do
    get pedido_productos_create_url
    assert_response :success
  end

  test "should get update" do
    get pedido_productos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pedido_productos_destroy_url
    assert_response :success
  end
end
