class AddPostImageIdToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :post_image_id, :integer, null: false
  end
end
