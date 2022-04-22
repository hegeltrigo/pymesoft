class ChangeValue < ActiveRecord::Migration[5.2]
  def change
    change_column :specification_values, :value, :string
  end
end
