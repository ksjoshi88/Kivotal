require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should be invalid without a title" do
    project = build(:project, title: nil)
    assert_not project.valid?
  end

  test "should be invalid without a manager" do
    project = build(:project, manager: nil)
    assert_not project.valid?
  end

  test "should be invalid without a unique title" do
    project1 = create(:project, title: "project1")
    project2 = build(:project, title: "project1")
    assert_not project2.valid?
  end

  test "should be valid without a title and a manager" do
    project = build(:project)
    assert project.valid?
  end

  test "should delete all tasks when a project is deleted" do
    project = create(:project)
    2.times do
      create(:task, project: project)
    end
    Project.destroy_all
    assert_equal Task.all.count, 0
  end

end
