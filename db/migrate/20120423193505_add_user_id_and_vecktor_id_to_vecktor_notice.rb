class AddUserIdAndVecktorIdToVecktorNotice < ActiveRecord::Migration
  def change
    add_column :vecktor_notices, :user_id, :integer
    add_column :vecktor_notices, :vecktor_id, :integer
  end
end
