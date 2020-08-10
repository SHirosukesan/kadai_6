require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get book" do
    get books_book_url
    assert_response :success
  end

end
