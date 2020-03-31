require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_protfolio" do
    get users_my_protfolio_url
    assert_response :success
  end

end
