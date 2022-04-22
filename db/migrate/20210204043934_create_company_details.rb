class CreateCompanyDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :company_details do |t|
      t.string :company_name
      t.string :nit
      t.timestamps
    end
  end
end
