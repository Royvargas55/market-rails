class AddCategoryToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :category_id, :integer
    add_index :orders, :category_id
  end
end
