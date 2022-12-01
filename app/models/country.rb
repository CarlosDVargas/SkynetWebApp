class Country < ApplicationRecord
  has_one_attached :icon do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end

  has_many :routes

  validates :name, :code, presence: true

end
