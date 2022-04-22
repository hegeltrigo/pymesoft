class Category < ApplicationRecord
  #include SchemaSearchable
  #searchkick index_name: tenant_index_name, text_start: [:name]

  validates :name, uniqueness: true
  validates :name, :description, presence: true
end
