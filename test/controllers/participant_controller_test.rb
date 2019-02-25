require 'test_helper'

class ParticipantControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get participant_index_url
    assert_response :success
  end

  test "should get create" do
    get participant_create_url
    assert_response :success
  end

  test "should get new" do
    get participant_new_url
    assert_response :success
  end

  test "should get destroy" do
    get participant_destroy_url
    assert_response :success
  end

end
