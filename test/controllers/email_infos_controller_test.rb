require 'test_helper'

class EmailInfosControllerTest < ActionController::TestCase
  setup do
    @email_info = email_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_info" do
    assert_difference('EmailInfo.count') do
      post :create, email_info: { email_id: @email_info.email_id, is_click: @email_info.is_click, is_open: @email_info.is_open }
    end

    assert_redirected_to email_info_path(assigns(:email_info))
  end

  test "should show email_info" do
    get :show, id: @email_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_info
    assert_response :success
  end

  test "should update email_info" do
    patch :update, id: @email_info, email_info: { email_id: @email_info.email_id, is_click: @email_info.is_click, is_open: @email_info.is_open }
    assert_redirected_to email_info_path(assigns(:email_info))
  end

  test "should destroy email_info" do
    assert_difference('EmailInfo.count', -1) do
      delete :destroy, id: @email_info
    end

    assert_redirected_to email_infos_path
  end
end
