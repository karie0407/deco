class AddPostImageIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :post_image_id, :integer, null: false
  end
end
