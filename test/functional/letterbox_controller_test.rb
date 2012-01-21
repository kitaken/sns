require 'test_helper'

class LetterBoxControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get conversation" do
    get :conversation
    assert_response :success
  end

end
