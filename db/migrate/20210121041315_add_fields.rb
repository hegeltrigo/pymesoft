class AddFields < ActiveRecord::Migration[5.2]
  def change
    add_column :specifications, :name, :string
    add_column :specification_values, :value, :float
  end
end
