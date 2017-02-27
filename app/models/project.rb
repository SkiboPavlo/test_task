class Project < ApplicationRecord
  has_many :task_lists, dependent: :destroy
  has_many :tasks, through: :task_lists, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :user
end


