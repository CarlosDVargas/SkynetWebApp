class Batch < ApplicationRecord
  belongs_to :product
  belongs_to :operation

  validates :current_operation, presence: true
  validates :product_id, presence: true
end
