class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, class_name: "User"
  belongs_to :task_list
  has_one :project, through: :task_list
  has_and_belongs_to_many :tags
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates_presence_of :title, :description, :user_id, :assignee_id, :task_list_id
end
