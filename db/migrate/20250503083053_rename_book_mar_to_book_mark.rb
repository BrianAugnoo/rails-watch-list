class RenameBookMarToBookMark < ActiveRecord::Migration[8.0]
  def change
    rename_table :bookmars, :bookmarks
  end
end
