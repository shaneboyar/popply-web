require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:shane)
    @other_user = users(:dickbutt)
  end
  
  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to splash_page_path
  end




end
