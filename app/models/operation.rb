class Operation < ApplicationRecord
  belongs_to :route
  has_many :batches

  validates :description, presence: true
  validates :code, presence: true, uniqueness: true
  validates :route_id, presence: true
end
