class AddPublishedToVecktor < ActiveRecord::Migration
  def change
    add_column :vecktors, :published, :boolean, :default => 0
  end
end
