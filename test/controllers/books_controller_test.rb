require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    get('/books')
    assert_response :ok

    books = JSON.parse(response.body)
    assert_equal 1, books.length
    assert_equal 'lol_book', books[0]["1"]["name"]
  end
end
