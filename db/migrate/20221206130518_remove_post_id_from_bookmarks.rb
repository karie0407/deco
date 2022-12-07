class RemovePostIdFromBookmarks < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookmarks, :post_id, :integer
  end
end
