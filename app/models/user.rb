class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate  :password_complexity
  validates :email,:first_name, :last_name, presence: true

  after_create :assign_default_role

  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/)
      errors.add :password, 'must include at least one lowercase letter, one uppercase letter, and one digit'
    end
  end

  def full_name
    first_name.capitalize + last_name.capitalize
  end

  def assign_default_role
    self.add_role(:developer) if self.roles.blank?
  end

  def is_manager?
    self.has_role? :manager
  end

  def is_developer?
    self.has_role? :developer
  end

end
