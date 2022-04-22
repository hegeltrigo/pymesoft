class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.decimal :amount
      t.decimal :total_amount
      t.decimal :remaining_amount
      t.decimal :discount
      t.decimal :tax
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
