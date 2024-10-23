class Purchase < ApplicationRecord
  belongs_to :product
  has_one_attached :check

  validates :city, :np_post_office, :phone_number, :full_name, presence: true
end
