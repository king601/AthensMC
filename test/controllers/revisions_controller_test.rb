require 'test_helper'

class RevisionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get revisions_path
    assert_response :success
  end

  # TODO: Write more tests for RevisionsController
end
