class AddMemoToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :memo, :string
  end
end
