require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test "should get user_id:string" do
    get conversations_user_id:string_url
    assert_response :success
  end

  test "should get message_id:string" do
    get conversations_message_id:string_url
    assert_response :success
  end

end
