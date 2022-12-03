class Batch < ApplicationRecord
  belongs_to :product
  belongs_to :operation

  validates :current_operation, presence: true
  validates :product_id, presence: true
  validates :operation_id, presence: true
  validates :units, presence: true, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 1500 }
end
