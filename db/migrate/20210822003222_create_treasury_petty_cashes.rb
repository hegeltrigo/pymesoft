class CreateTreasuryPettyCashes < ActiveRecord::Migration[5.2]
  def change
    create_table :treasury_petty_cashes do |t|
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
