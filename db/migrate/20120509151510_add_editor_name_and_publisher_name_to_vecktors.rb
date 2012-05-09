class AddEditorNameAndPublisherNameToVecktors < ActiveRecord::Migration
  def change
    add_column :vecktors, :editor_name,    :string
    add_column :vecktors, :publisher_name, :string
  end
end
