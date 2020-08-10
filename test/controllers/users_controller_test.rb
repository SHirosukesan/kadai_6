require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get book" do
    get users_book_url
    assert_response :success
  end

end
