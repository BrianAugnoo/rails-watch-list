class CreateBookmars < ActiveRecord::Migration[8.0]
  def change
    create_table :bookmars do |t|
      t.text :comment
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
