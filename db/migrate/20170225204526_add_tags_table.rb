class AddTagsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :title
      t.text :description
      t.belongs_to :project, index: true
    end
  end
end
