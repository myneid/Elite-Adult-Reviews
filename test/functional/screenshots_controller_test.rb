require File.dirname(__FILE__) + '/../test_helper'

class ScreenshotsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:screenshots)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_screenshot
    assert_difference('Screenshot.count') do
      post :create, :screenshot => { }
    end

    assert_redirected_to screenshot_path(assigns(:screenshot))
  end

  def test_should_show_screenshot
    get :show, :id => screenshots(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => screenshots(:one).id
    assert_response :success
  end

  def test_should_update_screenshot
    put :update, :id => screenshots(:one).id, :screenshot => { }
    assert_redirected_to screenshot_path(assigns(:screenshot))
  end

  def test_should_destroy_screenshot
    assert_difference('Screenshot.count', -1) do
      delete :destroy, :id => screenshots(:one).id
    end

    assert_redirected_to screenshots_path
  end
end
