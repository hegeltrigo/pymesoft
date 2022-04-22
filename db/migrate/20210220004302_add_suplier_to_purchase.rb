class AddSuplierToPurchase < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchases, :supplier_nit, :supplier_id
    remove_column :purchases, :supplier_name
    change_column :purchases, :supplier_id, :integer, using: 'supplier_id::integer' 
    add_foreign_key :purchases, :suppliers
  end
end
