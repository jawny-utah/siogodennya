class Purchase < ApplicationRecord
  belongs_to :product
  has_one_attached :check

  validates :city, :np_post_office, :phone_number, :full_name, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["check_attachment", "check_blob", "product"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["city", "comment", "created_at", "full_name", "id", "np_post_office", "phone_number", "product_id", "updated_at", "check"]
  end
end
