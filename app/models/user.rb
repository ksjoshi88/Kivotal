class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :rememberable, :timeoutable and :omniauthable
  #
  attr_accessor :as_manager
  devise :database_authenticatable, :registerable, :trackable, :validatable

  #validations
  validate  :password_complexity
  validates :email,:first_name, :last_name, presence: true

  after_create :assign_default_role

  #relationships
  has_many :projects, foreign_key: :manager_id
  has_many :tasks,    foreign_key: :developer_id

  has_many :work_projects, :through => :tasks, :source => :project


  #scopes
  scope :developers, -> { self.with_any_role('developer')}
  scope :managers, -> { self.with_any_role('manager')}

  #helpers
  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/)
      errors.add :password, 'must include at least one lowercase letter, one uppercase letter, and one digit'
    end
  end

  def full_name
    first_name.capitalize + ' ' + last_name.capitalize
  end

  def assign_default_role
    if self.as_manager == "1"
      self.add_role(:manager)
    else
      self.add_role(:developer)
    end
  end

  def is_manager?
    self.has_role? :manager
  end

  def is_developer?
    self.has_role? :developer
  end

end
