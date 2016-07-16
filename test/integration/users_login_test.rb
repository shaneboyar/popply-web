require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  test "login with invalid information" do
    get splash_page_path
    assert_template 'pages/new'
  end

end
