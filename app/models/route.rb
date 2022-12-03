class Route < ApplicationRecord
  belongs_to :country
  has_many :operations

  validates :description, presence: true
  validates :code, presence: true, uniqueness: true
  validates :country_id, presence: true
  validate :has_one_operation_at_least, :on => :create

  def products
    products = []
    operations.each do |operation|
      operation.batches.each do |batch|
        products << batch.product
      end
    end
    products = products.uniq
  end

  def has_one_operation_at_least
    if operations.empty?
      errors.add(:operations, "Route must have at least one operation")
    end
  end
end
