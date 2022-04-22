class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.date :purchase_date
      t.string :supplier_nit
      t.string :supplier_name
      t.string :invoice_number
      t.string :dui_number
      t.timestamps
    end
  end
end
