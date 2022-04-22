class SpecificationProduct < ApplicationRecord
  belongs_to :specification_value
  belongs_to :item
end
