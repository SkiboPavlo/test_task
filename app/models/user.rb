class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :assigned_to_tasks, class_name: 'Task', foreign_key: :assignee_id, source: :assignee
end
