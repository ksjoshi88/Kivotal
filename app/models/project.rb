class Project < ApplicationRecord
  has_many :tasks

  belongs_to :manager, :class_name => :User , foreign_key: :manager_id
  has_many   :tasks, :dependent => :delete_all
  has_many   :developers, through: :tasks

  validates :title,:manager_id, presence: true
  validates :title, uniqueness: true


end
