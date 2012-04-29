class AddOrderToVecktorNotice < ActiveRecord::Migration
  def change
    add_column :vector_notices, :order, :integer
  end
end
