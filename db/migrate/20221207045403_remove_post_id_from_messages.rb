class RemovePostIdFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :post_id, :integer
  end
end
