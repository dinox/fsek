class CreateVecktors < ActiveRecord::Migration
  def change
    create_table :vecktors do |t|
      t.int :year
      t.int :issue
      t.string :editor
      t.string :responsible_publisher

      t.timestamps
    end
  end
end
