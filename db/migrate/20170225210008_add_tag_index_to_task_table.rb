class AddTagIndexToTaskTable < ActiveRecord::Migration[5.0]
  def change
    add_index :tasks, :tag_id
  end
end
