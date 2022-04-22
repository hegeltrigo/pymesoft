class Specification < ApplicationRecord
  has_many :specification_values
  validates :name, presence: true
end
