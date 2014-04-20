require 'test_helper'

class TariffPricesControllerTest < ActionController::TestCase
  setup do
    @tariff_price = tariff_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tariff_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tariff_price" do
    assert_difference('TariffPrice.count') do
      post :create, tariff_price: { modual: @tariff_price.modual, number: @tariff_price.number, unit_price: @tariff_price.unit_price }
    end

    assert_redirected_to tariff_price_path(assigns(:tariff_price))
  end

  test "should show tariff_price" do
    get :show, id: @tariff_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tariff_price
    assert_response :success
  end

  test "should update tariff_price" do
    patch :update, id: @tariff_price, tariff_price: { modual: @tariff_price.modual, number: @tariff_price.number, unit_price: @tariff_price.unit_price }
    assert_redirected_to tariff_price_path(assigns(:tariff_price))
  end

  test "should destroy tariff_price" do
    assert_difference('TariffPrice.count', -1) do
      delete :destroy, id: @tariff_price
    end

    assert_redirected_to tariff_prices_path
  end
end
