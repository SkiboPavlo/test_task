class Project < ApplicationRecord
  has_many :task_lists, dependent: :destroy
  has_many :tasks, through: :task_lists, dependent: :destroy
  has_many :tags, dependent: :destroy
  mount_uploader :attachment, ProjectUploader # Tells rails to use this uploader for this model.
  belongs_to :user
end


