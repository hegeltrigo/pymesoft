class Service < ApplicationRecord
  # include SchemaSearchable
  # searchkick index_name: tenant_index_name, text_start: [:name]

  validates :name, :price, presence: true

end
