require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest

  test 'should redirect to login page if not logged in' do
    get dashboard_index_url
    assert_redirected_to new_user_session_path
  end

  test 'should be able to access the dashbaord upon successful login' do
    user = FactoryBot.create(:user)
    sign_in user
    get dashboard_index_url
    assert_response :success
  end

end
