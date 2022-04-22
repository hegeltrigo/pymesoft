class AddActiveToTreasuryPettyCash < ActiveRecord::Migration[5.2]
  def change
    add_column :treasury_petty_cashes, :active, :boolean
  end
end
