class AddPhoneToCompany < ActiveRecord::Migration[5.2]
  def up
    add_column :company_details, :phone_number, :string
  end

  def down
    remove_column :company_details, :phone_number
  end
end
