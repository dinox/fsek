class VecktorAddYear < ActiveRecord::Migration
  def change 
    add_column :vecktors, :year, :integer
  end
end
