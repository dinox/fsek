class AddAccessIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :access_id, :integer
  end
end
