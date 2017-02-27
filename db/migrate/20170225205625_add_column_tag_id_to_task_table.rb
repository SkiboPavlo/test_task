class AddColumnTagIdToTaskTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :tag_id, :integer, index: true
  end
end
