require 'test_helper'

class DesignSamplesControllerTest < ActionController::TestCase
  setup do
    @design_sample = design_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:design_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create design_sample" do
    assert_difference('DesignSample.count') do
      post :create, design_sample: { date: @design_sample.date, description: @design_sample.description, name: @design_sample.name, website: @design_sample.website }
    end

    assert_redirected_to design_sample_path(assigns(:design_sample))
  end

  test "should show design_sample" do
    get :show, id: @design_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @design_sample
    assert_response :success
  end

  test "should update design_sample" do
    patch :update, id: @design_sample, design_sample: { date: @design_sample.date, description: @design_sample.description, name: @design_sample.name, website: @design_sample.website }
    assert_redirected_to design_sample_path(assigns(:design_sample))
  end

  test "should destroy design_sample" do
    assert_difference('DesignSample.count', -1) do
      delete :destroy, id: @design_sample
    end

    assert_redirected_to design_samples_path
  end
end
