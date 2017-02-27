class DestroyTagIdColumnInTaskTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :tag_id, :integer, index: true
  end
end
