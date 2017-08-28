require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get profile' do
    get user_path(@user.username)
    assert_response :success
  end
end
