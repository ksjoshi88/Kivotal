require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #


  test 'should not create user unless a valid password' do
    user = FactoryBot.build(:user, password: 'invalid', password_confirmation: 'invalid')
    assert_not user.valid?
  end

  test 'should not create user unless provides first and last name' do
    user = FactoryBot.build(:user, first_name: nil, last_name: nil)
    assert_not user.valid?
  end

  test 'should not create user unless provides valid email' do
    user = FactoryBot.build(:user, email: nil)
    assert_not user.valid?
  end

  test 'should not create user with duplicate email' do
    user1 = FactoryBot.create(:user, email: 'user@kivotal.com')
    user2 = FactoryBot.build(:user, email: 'user@kivotal.com')
    assert_not user2.valid?
  end


end
