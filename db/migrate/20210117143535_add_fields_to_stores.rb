class AddFieldsToStores < ActiveRecord::Migration[5.2]
  def up
    add_column :stores, :name, :string
    add_column :stores, :description, :string
  end

  def down
  end
end
