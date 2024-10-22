class Product < ApplicationRecord
  alias_attribute :header, :title

  scope :active, -> { where(active: true) }

  def self.ransackable_attributes(auth_object = nil)
    ["active", "created_at", "description", "header", "id", "image_url", "price", "title", "updated_at"]
  end
end
