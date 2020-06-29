class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :client
      t.string :project
      t.string :description

      t.timestamps
    end
  end
end
