class Store < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :description,presence: true
end
