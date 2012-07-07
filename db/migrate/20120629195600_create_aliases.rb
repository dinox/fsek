class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.integer :page_id
      t.string  :url

      t.timestamps
    end
  end
end
