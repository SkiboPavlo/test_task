class AddTablesProjectsAndTask < ActiveRecord::Migration[5.0]
  def change

    create_table :projects do |t|
      t.string :title
      t.belongs_to :user, index: true
    end

    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
    end
  end
end

