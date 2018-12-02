class AddStatsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :stats, :string
  end
end
