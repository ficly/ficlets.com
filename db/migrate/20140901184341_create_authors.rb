class CreateAuthors < ActiveRecord::Migration
  def up
    create_table :authors do |t|
      t.string :name
      t.string :uri_name
      t.text   :bio
      t.timestamps
    end
  end

  def down
    drop_table :authors
  end
end
