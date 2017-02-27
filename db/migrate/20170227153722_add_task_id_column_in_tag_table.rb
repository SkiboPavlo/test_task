class AddTaskIdColumnInTagTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :tags, :task, index: true
  end
end
