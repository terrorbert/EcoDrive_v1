require 'test_helper'

class EddbControllerTest < ActionController::TestCase
  test "should get publish" do
    get :publish
    assert_response :success
  end

end
