class DropTableTagsTasksTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :table_tags_tasks
  end
end
