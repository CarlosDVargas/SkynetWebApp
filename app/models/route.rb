class Route < ApplicationRecord
  belongs_to :country
  has_many :operations

  validates :description, presence: true
  validates :code, presence: true, uniqueness: true
  validates :country_id, presence: true
end
