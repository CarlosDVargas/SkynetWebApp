class Country < ApplicationRecord
  has_one_attached :icon do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end

end