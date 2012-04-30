class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :original_author_id
      t.integer :recent_author_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
