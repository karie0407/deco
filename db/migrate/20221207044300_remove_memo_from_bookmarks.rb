class RemoveMemoFromBookmarks < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookmarks, :memo, :text
  end
end
