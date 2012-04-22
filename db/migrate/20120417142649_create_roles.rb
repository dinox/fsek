class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.string :tag
      t.string :description

      t.timestamps
    end
  end
end
