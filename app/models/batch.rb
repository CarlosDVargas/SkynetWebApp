class Batch < ApplicationRecord
  belongs_to :product
  belongs_to :operation
end
