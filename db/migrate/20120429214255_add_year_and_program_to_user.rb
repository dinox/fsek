class AddYearAndProgramToUser < ActiveRecord::Migration
  def change
    add_column :users, :year, :integer
    add_column :users, :program, :string
  end
end
