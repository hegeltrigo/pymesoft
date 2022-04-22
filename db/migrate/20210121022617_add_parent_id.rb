class AddParentId < ActiveRecord::Migration[5.2]
  def up
    add_column :categories, :parent_id, :integer
  end

  def down
    remove_column :categories, :parent_id
  end
end
