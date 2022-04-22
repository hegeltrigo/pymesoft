class AddInvoiceIdForSale < ActiveRecord::Migration[5.2]
  def up
    add_column :sales, :invoice_id, :integer
    add_foreign_key :sales, :invoices
  end

  def down
  end
end
