require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get redirected to login page if not logged in" do
    get home_index_url
    assert_redirected_to new_user_session_path
  end

  test 'should be able to access the home page upon successful login' do
    user = FactoryBot.create(:user)
    sign_in user
    get home_index_url
    assert_response :success
  end

end
