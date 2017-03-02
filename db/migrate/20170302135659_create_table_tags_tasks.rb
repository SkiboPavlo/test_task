class CreateTableTagsTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :table_tags_tasks, id: false do |t|
      t.belongs_to :tags, index: true
      t.belongs_to :tasks, index: true
    end
  end
end
