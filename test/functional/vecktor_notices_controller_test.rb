require 'test_helper'

class VecktorNoticesControllerTest < ActionController::TestCase
  setup do
    @vecktor_notice = vecktor_notices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vecktor_notices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vecktor_notice" do
    assert_difference('VecktorNotice.count') do
      post :create, vecktor_notice: { signature: @vecktor_notice.signature, text: @vecktor_notice.text, title: @vecktor_notice.title }
    end

    assert_redirected_to vecktor_notice_path(assigns(:vecktor_notice))
  end

  test "should show vecktor_notice" do
    get :show, id: @vecktor_notice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vecktor_notice
    assert_response :success
  end

  test "should update vecktor_notice" do
    put :update, id: @vecktor_notice, vecktor_notice: { signature: @vecktor_notice.signature, text: @vecktor_notice.text, title: @vecktor_notice.title }
    assert_redirected_to vecktor_notice_path(assigns(:vecktor_notice))
  end

  test "should destroy vecktor_notice" do
    assert_difference('VecktorNotice.count', -1) do
      delete :destroy, id: @vecktor_notice
    end

    assert_redirected_to vecktor_notices_path
  end
end
