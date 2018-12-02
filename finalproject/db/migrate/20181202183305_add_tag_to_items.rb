class AddTagToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :tag, :string
  end
end
