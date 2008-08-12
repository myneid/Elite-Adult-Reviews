require File.dirname(__FILE__) + '/../test_helper'

class SubRatingsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_ratings)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_sub_rating
    assert_difference('SubRating.count') do
      post :create, :sub_rating => { }
    end

    assert_redirected_to sub_rating_path(assigns(:sub_rating))
  end

  def test_should_show_sub_rating
    get :show, :id => sub_ratings(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => sub_ratings(:one).id
    assert_response :success
  end

  def test_should_update_sub_rating
    put :update, :id => sub_ratings(:one).id, :sub_rating => { }
    assert_redirected_to sub_rating_path(assigns(:sub_rating))
  end

  def test_should_destroy_sub_rating
    assert_difference('SubRating.count', -1) do
      delete :destroy, :id => sub_ratings(:one).id
    end

    assert_redirected_to sub_ratings_path
  end
end
