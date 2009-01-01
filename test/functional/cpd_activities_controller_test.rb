require 'test_helper'

class CPDActivitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpd_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpd_activity" do
    assert_difference('CPDActivity.count') do
      post :create, :cpd_activity => { }
    end

    assert_redirected_to cpd_activity_path(assigns(:cpd_activity))
  end

  test "should show cpd_activity" do
    get :show, :id => cpd_activities(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cpd_activities(:one).id
    assert_response :success
  end

  test "should update cpd_activity" do
    put :update, :id => cpd_activities(:one).id, :cpd_activity => { }
    assert_redirected_to cpd_activity_path(assigns(:cpd_activity))
  end

  test "should destroy cpd_activity" do
    assert_difference('CPDActivity.count', -1) do
      delete :destroy, :id => cpd_activities(:one).id
    end

    assert_redirected_to cpd_activities_path
  end
end
