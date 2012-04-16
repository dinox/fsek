class AddAccessIdToPost < ActiveRecord::Migration
  def change
    add_column :post, :access_id, :integer
  end
end
