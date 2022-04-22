class SpecificationValue < ApplicationRecord
  belongs_to :specification
  has_many :specification_products

  validates :value, :specification_id, presence: true

end
