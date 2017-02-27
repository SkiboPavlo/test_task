class AddColumnListTaskToTaskTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :task_list, index: true
  end
end
