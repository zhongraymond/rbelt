class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :user, index: true
      t.string :title
      t.string :artist

      t.timestamps
    end
  end
end
