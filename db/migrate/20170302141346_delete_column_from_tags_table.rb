class DeleteColumnFromTagsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :task_id, :integer, index: true
  end
end
