class AddFielsToInvoiceDosage < ActiveRecord::Migration[5.2]
  def up
    add_column :invoice_dosages, :legend, :text
    add_column :invoice_dosages, :computarized, :boolean
  end

  def down
    remove_column :invoice_dosages, :legend
    remove_column :invoice_dosages, :computarized
  end
end
