require 'test_helper'

class OrderOnlinesControllerTest < ActionController::TestCase
  setup do
    @order_online = order_onlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_onlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_online" do
    assert_difference('OrderOnline.count') do
      post :create, order_online: { company_name: @order_online.company_name, description: @order_online.description, email: @order_online.email, mobile: @order_online.mobile, name: @order_online.name, phone: @order_online.phone, text_msg: @order_online.text_msg, web_site: @order_online.web_site }
    end

    assert_redirected_to order_online_path(assigns(:order_online))
  end

  test "should show order_online" do
    get :show, id: @order_online
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_online
    assert_response :success
  end

  test "should update order_online" do
    patch :update, id: @order_online, order_online: { company_name: @order_online.company_name, description: @order_online.description, email: @order_online.email, mobile: @order_online.mobile, name: @order_online.name, phone: @order_online.phone, text_msg: @order_online.text_msg, web_site: @order_online.web_site }
    assert_redirected_to order_online_path(assigns(:order_online))
  end

  test "should destroy order_online" do
    assert_difference('OrderOnline.count', -1) do
      delete :destroy, id: @order_online
    end

    assert_redirected_to order_onlines_path
  end
end
