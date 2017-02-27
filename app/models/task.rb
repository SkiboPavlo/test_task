class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, class_name: "User"
  belongs_to :task_list
  has_many :tags, dependent: :destroy
  validates_presence_of :title, :description, :user_id, :assignee_id, :task_list_id
end
