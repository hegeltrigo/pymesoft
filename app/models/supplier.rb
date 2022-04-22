class Supplier < ApplicationRecord
  has_many :inputs, dependent: :destroy
  has_many :purchases, dependent: :destroy
  validates :name, :identifier, uniqueness: true
  validates :name, :address, :cellphone, :identifier, presence: true
end
