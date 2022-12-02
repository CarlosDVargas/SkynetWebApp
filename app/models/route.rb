class Route < ApplicationRecord
  belongs_to :country
  has_many :operations

  validates :description, presence: true
  validates :code, presence: true, uniqueness: true
  validates :country_id, presence: true

  def get_products
    products = []
    operations.each do |operation|
      operation.batches.each do |batch|
        products << batch.product
      end
    end
    products
  end
end
