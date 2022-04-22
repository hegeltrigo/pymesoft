class CreateTreasuryOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :treasury_outputs do |t|
      t.datetime :input_date
      t.text :description
      t.decimal :quantity
      t.belongs_to :treasury_petty_cash, foreign_key: true

      t.timestamps
    end
  end
end
