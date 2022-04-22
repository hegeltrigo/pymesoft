class AddItemLineItemRelacion < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :line_items, :items
  end
end
