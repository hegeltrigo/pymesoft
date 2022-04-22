class AddOtherInformationToCompanyDetails < ActiveRecord::Migration[5.2]
  def up
    add_column :company_details, :city, :string
    add_column :company_details, :state, :string
    add_column :company_details, :country, :string
  end

  def down
    remove_column :company_details, :city
    remove_column :company_details, :state
    remove_column :company_details, :country
  end
end
