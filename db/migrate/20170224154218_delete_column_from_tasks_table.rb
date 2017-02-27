class DeleteColumnFromTasksTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :project_id, :integer, index: true
    remove_column :tasks, :task_list_id, :integer
  end
end
