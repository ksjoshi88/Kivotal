require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get redirected to login page if not logged in" do
    get home_index_url
    assert_redirected_to new_user_session_path
  end

  test 'should be able to access the home page upon successful login' do
    user = create(:user)
    sign_in user
    get home_index_url
    assert_response :success
  end

  test "should be able to view manager homepage when logged in as manager" do
    user = create(:manager)
    sign_in user
    get home_index_url
    assert_response :success
    assert_select '.manager-homepage-container',1
  end

  test "should be able to view developer homepage when logged in as developer" do
    user = create(:developer)
    sign_in user
    get home_index_url
    assert_response :success
    assert_select '.developer-homepage-container',1
  end

  test "manage should be able to see data about all his/her projects" do
    manager = create(:manager)
    3.times do
      create(:project, manager: manager)
    end
    sign_in manager
    get home_index_url
    assert_equal assigns(:projects).count, 3
  end

end
