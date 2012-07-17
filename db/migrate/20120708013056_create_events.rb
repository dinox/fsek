class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :text
      t.datetime :begins_at
      t.datetime :ends_at
      t.integer :user_id
      t.integer :page_id

      t.timestamps
    end
  end
end
