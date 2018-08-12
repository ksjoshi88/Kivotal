class Task < ApplicationRecord

  belongs_to :project
  belongs_to :developer, :class_name => :User , foreign_key: :developer_id, optional: true

  enum status: [:unassigned, :assigned, :in_progress, :done]

  validates :todo,:status,:project_id, presence: true
  validate :must_have_developer_for_assigned_task


  def must_have_developer_for_assigned_task
  if self.assigned? && developer_id.nil?
      errors.add(:developer_id, "developer can not be null for assigned tasks")
    end
  end
end
