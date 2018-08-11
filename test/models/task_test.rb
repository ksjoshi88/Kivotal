require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #

  test 'should be invalid without a todo' do
    task =  build(:task, todo: nil)
    assert_not task.valid?
  end

  test 'should be invalid without a project' do
    task =  build(:task, project: nil)
    assert_not task.valid?
  end

  test 'should be valid with all correct data' do
    task =  build(:task, :done)
    assert task.valid?
  end

end
