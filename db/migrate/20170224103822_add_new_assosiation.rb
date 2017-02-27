class AddNewAssosiation < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :assignee, foreign_key: true
  end
end
