class RemovePublisherAndEditorFromVecktor < ActiveRecord::Migration
  def change
    remove_column :vecktors, :editor
    remove_column :vecktors, :publisher
  end
end
