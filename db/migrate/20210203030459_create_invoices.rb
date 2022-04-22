class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :number
      t.string :customer_nit
      t.string :customer_name
      t.date :issue_date
      t.decimal :amount
      t.decimal :applicable_tax_credit_amount
      t.decimal :ice_iehd_amount
      t.decimal :amount_for_sales_at_zero_rate
      t.decimal :amount_not_subject_to_tax_credit 
      t.decimal :rebates_and_discounts_earned
      t.string :state
      t.string :control_code
      t.integer :user_id
      t.integer :invoice_dosage_id
      t.timestamps
    end
  end
end
