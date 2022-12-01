class Operation < ApplicationRecord
  belongs_to :route
  has_many :batches
end
