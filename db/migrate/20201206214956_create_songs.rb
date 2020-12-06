class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.integer :release_year
      t.integer :user_id
      t.integer :genre_id
    end
  end
end
