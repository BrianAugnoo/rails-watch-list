class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :add_title
      t.text :overview
      t.string :poster_url
      t.integer :rating

      t.timestamps
    end
  end
end
