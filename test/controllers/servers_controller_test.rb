require 'test_helper'

class ServersControllerTest < ActionController::TestCase
  test 'should get rrr' do
    get :rrr
    assert_response :success
  end

  test 'should get direwolf20' do
    get :direwolf20
    assert_response :success
  end
end
