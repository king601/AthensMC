require 'test_helper'

class CastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @cast = casts(:one)
  end

  test 'should get index' do
    get casts_url
    assert_response :success
  end

  test 'should get show' do
    get cast_path(@cast)
    assert_response :success
  end
end
