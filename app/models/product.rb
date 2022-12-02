class Product < ApplicationRecord
  validates :description, presence: true
  validates :code, presence: true, uniqueness: true, length: { maximum: 2 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :cost, presence: true, numericality: { greater_than: 0 }
end
