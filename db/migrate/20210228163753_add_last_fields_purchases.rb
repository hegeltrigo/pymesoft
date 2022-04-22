class AddLastFieldsPurchases < ActiveRecord::Migration[5.2]
  def up
    add_column :purchases, :amount_not_subjet_to_tax_credict, :integer
    add_column :purchases, :discounts_and_bonuses, :integer
  end

  def down
    remove_column :purchases, :amount_not_subjet_to_tax_credict
    remove_column :purchases, :discounts_and_bonuses
  end
end
