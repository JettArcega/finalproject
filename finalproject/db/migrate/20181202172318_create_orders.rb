class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :due_date
      t.integer :status

      t.timestamps
    end
  end
end
