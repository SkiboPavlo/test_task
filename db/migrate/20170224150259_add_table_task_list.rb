class AddTableTaskList < ActiveRecord::Migration[5.0]
  def change
    create_table :task_lists do |t|
      t.string :title
      t.belongs_to :project, index: true
    end
  end
end
