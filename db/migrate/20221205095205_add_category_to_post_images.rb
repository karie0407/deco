class AddCategoryToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :post_images, :category
  end
end
