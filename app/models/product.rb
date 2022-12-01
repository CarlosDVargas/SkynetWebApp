class Product < ApplicationRecord
  validate :description, presence: true
  validate :code, presence: true, uniqueness: true, length: { maximum: 2 }
  validate :price, presence: true, numericality: { greater_than: 0 }
  validate :cost, presence: true, numericality: { greater_than: 0 }
end
