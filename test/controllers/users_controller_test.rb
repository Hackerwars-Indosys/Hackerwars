require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { image_url: @user.image_url, job1: @user.job1, job2: @user.job2, job3: @user.job3, name: @user.name, old: @user.old, provider: @user.provider, result_id: @user.result_id, uid: @user.uid, university: @user.university } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { image_url: @user.image_url, job1: @user.job1, job2: @user.job2, job3: @user.job3, name: @user.name, old: @user.old, provider: @user.provider, result_id: @user.result_id, uid: @user.uid, university: @user.university } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
