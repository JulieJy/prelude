require 'test_helper'

class LibraryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get library_index_url
    assert_response :success
  end

  test "should get delete" do
    get library_delete_url
    assert_response :success
  end

  test "should get create" do
    get library_create_url
    assert_response :success
  end

end
