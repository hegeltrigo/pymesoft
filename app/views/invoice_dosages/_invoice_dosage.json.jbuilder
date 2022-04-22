json.extract! invoice_dosage, :id, :authorization_number, :emission_deadline, :invoice_initial_number, :dosage_key, :economic_activity, :active, :created_at, :updated_at
json.url invoice_dosage_url(invoice_dosage, format: :json)
