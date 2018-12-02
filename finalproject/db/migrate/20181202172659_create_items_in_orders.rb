class CreateItemsInOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :items_in_orders do |t|
      t.references :order
      t.references :item
      t.integer :quantity

      t.timestamps
    end
  end
end
