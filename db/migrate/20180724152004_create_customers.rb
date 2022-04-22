class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :number_id
      t.datetime :born_date
      t.string :nationality
      t.string :living_place
      t.string :address
      t.string :civil_status
      t.string :job
      t.string :company_name
      t.string :position
      t.decimal :money_income
      t.string :work_address
      t.string :working_time
      t.string :work_phone
      t.string :image

      t.timestamps
    end
  end
end
