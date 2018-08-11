require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should be invalid without a title" do
    project = FactoryBot.build(:project, title: nil)
    assert_not project.valid?
  end

  test "should be invalid without a manager" do
    project = FactoryBot.build(:project, manager: nil)
    assert_not project.valid?
  end

  test "should be invalid without a unique title" do
    project1 = FactoryBot.create(:project, title: "project1")
    project2 = FactoryBot.build(:project, title: "project1")
    assert_not project2.valid?
  end

  test "should be valid without a title and a manager" do
    project = FactoryBot.build(:project)
    assert project.valid?
  end

end
