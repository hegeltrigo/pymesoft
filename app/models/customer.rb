class Customer < ApplicationRecord
  # include SchemaSearchable
  # searchkick index_name: tenant_index_name, text_start: [:first_name]
  #enum customer_type = ["person", "company"]
  validates :nit, uniqueness: true

end
