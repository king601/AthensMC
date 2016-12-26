require 'test_helper'

class Admin::WhitelistRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
    sign_in(@user)
  end

  test 'should get index' do
    get admin_whitelist_requests_path
    assert_response :success
  end
end
