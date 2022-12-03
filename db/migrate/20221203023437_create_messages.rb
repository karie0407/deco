class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
       t.integer :customer_id, null: false
       t.integer :post_id, null: false
       t.timestamps
    end
  end
end
