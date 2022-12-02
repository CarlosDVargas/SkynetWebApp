class Operation < ApplicationRecord
  #belongs_to :route
  has_many :batches

  validates :description, presence: true
  validates :code, presence: true, uniqueness: true, length: { maximum: 4, minimum: 4 }
end
