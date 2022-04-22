class CreateInvoiceDosages < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_dosages do |t|
      t.string :authorization_number
      t.datetime :emission_deadline
      t.integer :invoice_initial_number
      t.string :dosage_key
      t.string :economic_activity
      t.boolean :active

      t.timestamps
    end
  end
end
