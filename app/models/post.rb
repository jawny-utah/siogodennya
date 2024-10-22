class Post < ApplicationRecord
  validates :header, :description, :video_link, presence: true

  scope :active, -> { where(active: true) }

  def self.ransackable_attributes(auth_object = nil)
    ["active", "created_at", "description", "header", "id", "updated_at", "video_link"]
  end
end
