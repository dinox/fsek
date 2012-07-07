class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.integer :page_id, :null => false
      t.string  :name, :null => false

#      t.timestamps
    end
  end
end
