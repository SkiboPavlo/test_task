class DeleteDescriptionColumnFromTableTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :description, :text
  end
end
