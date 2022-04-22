class Sale < ApplicationRecord
  belongs_to :customer
  belongs_to :invoice
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
end
