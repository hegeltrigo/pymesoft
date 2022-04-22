class AddSupplierIdInputs < ActiveRecord::Migration[5.2]
  def up
    add_column :inputs, :supplier_id, :integer
    add_foreign_key :inputs, :suppliers
  end

  def down
    remove_column :inputs, :supplier_id
    remove_foreign_key :inputs, :suppliers
  end
end
