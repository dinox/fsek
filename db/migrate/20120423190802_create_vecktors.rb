class CreateVecktors < ActiveRecord::Migration
  def change
    create_table :vecktors do |t|
      t.integer :year
      t.integer :issue
      t.string :editor
      t.string :publisher

      t.timestamps
    end
  end
end
