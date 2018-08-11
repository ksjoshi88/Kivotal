class Task < ApplicationRecord

  belongs_to :project
  belongs_to :developer, :class_name => :User , foreign_key: :developer_id

  enum status: [:unassigned, :assigned, :in_progress, :done]

  validates :todo,:status,:project_id, presence: true

end
