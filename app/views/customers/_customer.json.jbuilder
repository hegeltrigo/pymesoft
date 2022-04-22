json.extract! customer, :id, :first_name, :last_name, :sex, :number_id, :born_date, :nationality, :living_place, :address, :civil_status, :job, :company_name, :position, :money_income, :work_address, :working_time, :work_phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
