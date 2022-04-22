class AddTickectType < ActiveRecord::Migration[5.2]
  def up
    add_column :purchases, :ticket_type, :integer
    add_column :purchases, :sales_type,   :integer
  end

  def down
    remove_column :purchases, :ticket_type
    remove_column :purchases, :sales_type
  end
end
