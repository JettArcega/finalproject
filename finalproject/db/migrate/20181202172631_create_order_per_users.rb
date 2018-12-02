class CreateOrderPerUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :order_per_users do |t|
      t.references :order
      t.references :user

      t.timestamps
    end
  end
end
