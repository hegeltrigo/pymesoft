class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :category, required: false # a service or a unique product for invoice doesnt have category
  has_many :specification_products
  has_many :line_items

  validates :sku, :name, uniqueness: true
  validates :name, :price, :sku, presence: true

end
