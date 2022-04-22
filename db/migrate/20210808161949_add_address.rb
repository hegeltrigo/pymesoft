class AddAddress < ActiveRecord::Migration[5.2]
  def up
    add_column :company_details, :address, :string
  end

  def down
    remove_column :company_details, :address, :string
  end
end
