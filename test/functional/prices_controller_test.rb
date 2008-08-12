require File.dirname(__FILE__) + '/../test_helper'

class PricesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:prices)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_price
    assert_difference('Price.count') do
      post :create, :price => { }
    end

    assert_redirected_to price_path(assigns(:price))
  end

  def test_should_show_price
    get :show, :id => prices(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => prices(:one).id
    assert_response :success
  end

  def test_should_update_price
    put :update, :id => prices(:one).id, :price => { }
    assert_redirected_to price_path(assigns(:price))
  end

  def test_should_destroy_price
    assert_difference('Price.count', -1) do
      delete :destroy, :id => prices(:one).id
    end

    assert_redirected_to prices_path
  end
end
