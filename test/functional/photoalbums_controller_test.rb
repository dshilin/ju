require 'test_helper'

class PhotoalbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photoalbums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photoalbum" do
    assert_difference('Photoalbum.count') do
      post :create, :photoalbum => { }
    end

    assert_redirected_to photoalbum_path(assigns(:photoalbum))
  end

  test "should show photoalbum" do
    get :show, :id => photoalbums(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => photoalbums(:one).id
    assert_response :success
  end

  test "should update photoalbum" do
    put :update, :id => photoalbums(:one).id, :photoalbum => { }
    assert_redirected_to photoalbum_path(assigns(:photoalbum))
  end

  test "should destroy photoalbum" do
    assert_difference('Photoalbum.count', -1) do
      delete :destroy, :id => photoalbums(:one).id
    end

    assert_redirected_to photoalbums_path
  end
end
