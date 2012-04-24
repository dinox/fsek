class CreateVecktorNotices < ActiveRecord::Migration
  def change
    create_table :vecktor_notices do |t|
      t.string :title
      t.text :text
      t.string :signature

      t.timestamps
    end
  end
end
