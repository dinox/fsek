class AddOrderToVecktorNotice < ActiveRecord::Migration
  def change
    add_column :vecktor_notices, :order, :integer
  end
end
