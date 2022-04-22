class FixLineItemsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :line_items, :productable_id, :item_id
    remove_column :line_items, :productable_type
  end
end
