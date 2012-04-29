class VecktorHasOneEditorAndPublisher < ActiveRecord::Migration
  def change
    add_column :vecktors, :editor_id, :integer
    add_column :vecktors, :publisher_id, :integer
  end
end
