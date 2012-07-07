class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.integer :page_id
      t.string  :name

#      t.timestamps
    end
  end
end
