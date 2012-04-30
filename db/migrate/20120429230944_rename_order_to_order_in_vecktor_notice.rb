class RenameOrderToOrderInVecktorNotice < ActiveRecord::Migration
  def change
    rename_column :vecktor_notices, :order, :order_
  end
end
