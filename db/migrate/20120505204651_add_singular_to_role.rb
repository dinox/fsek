class AddSingularToRole < ActiveRecord::Migration
  def change
    add_column :roles, :singular, :boolean, :null => false, :default => false
  end
end
