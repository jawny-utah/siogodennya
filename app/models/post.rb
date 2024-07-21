class Post < ApplicationRecord
  validates :header, :description, :video_link, presence: true
end
