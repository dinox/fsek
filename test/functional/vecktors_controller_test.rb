require 'test_helper'

class VecktorsControllerTest < ActionController::TestCase
  setup do
    @vecktor = vecktors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vecktors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vecktor" do
    assert_difference('Vecktor.count') do
      post :create, vecktor: { editor: @vecktor.editor, issue: @vecktor.issue, responsible_publisher: @vecktor.responsible_publisher, year: @vecktor.year }
    end

    assert_redirected_to vecktor_path(assigns(:vecktor))
  end

  test "should show vecktor" do
    get :show, id: @vecktor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vecktor
    assert_response :success
  end

  test "should update vecktor" do
    put :update, id: @vecktor, vecktor: { editor: @vecktor.editor, issue: @vecktor.issue, responsible_publisher: @vecktor.responsible_publisher, year: @vecktor.year }
    assert_redirected_to vecktor_path(assigns(:vecktor))
  end

  test "should destroy vecktor" do
    assert_difference('Vecktor.count', -1) do
      delete :destroy, id: @vecktor
    end

    assert_redirected_to vecktors_path
  end
end
