class AddAssociations < ActiveRecord::Migration[5.2]
  def change
    add_column :specification_values, :specification_id, :integer
    add_foreign_key :specification_values, :specifications

    add_column :specification_products, :specification_value_id, :integer
    add_foreign_key :specification_products, :specification_values

    add_column :specification_products, :item_id, :integer
    add_foreign_key :specification_products, :items
  end
end
