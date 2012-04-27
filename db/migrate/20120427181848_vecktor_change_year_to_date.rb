class VecktorChangeYearToDate < ActiveRecord::Migration
  def change
    remove_column :vecktors, :year 
    add_column    :vecktors, :date, :date
  end
end
