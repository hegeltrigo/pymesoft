class AddFieldsPurchase < ActiveRecord::Migration[5.2]
  def up
    add_column :purchases, :authorization_number, :string
    add_column :purchases, :amount, :float
    add_column :purchases, :control_code, :string
    add_column :purchases, :purchase_type, :string
  end

  def down
  end
end
