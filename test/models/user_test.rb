require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #

  setup do
    Role.find_or_create_by(name: :manager)
    Role.find_or_create_by(name: :developer)
  end

  test 'should not create user unless a valid password' do
    user = build(:user, password: 'invalid', password_confirmation: 'invalid')
    assert_not user.valid?
  end

  test 'should not create user unless provides first and last name' do
    user = build(:user, first_name: nil, last_name: nil)
    assert_not user.valid?
  end

  test 'should not create user unless provides valid email' do
    user = build(:user, email: nil)
    assert_not user.valid?
  end

  test 'should not create user with duplicate email' do
    user1 = create(:user, email: 'user@kivotal.com')
    user2 = build(:user, email: 'user@kivotal.com')
    assert_not user2.valid?
  end

  test 'should return concatenated names as full_name' do
    user = create(:user, first_name: 'jen', last_name: 'doe')
    assert_equal user.full_name, 'Jen Doe'
  end

  test 'should be assigned role based on as_manager attribute' do
    user1 = create(:user, as_manager: "0")
    assert user1.has_role? :developer
    user2 = create(:user, as_manager: "1")
    assert user2.has_role? :manager

  end


end
