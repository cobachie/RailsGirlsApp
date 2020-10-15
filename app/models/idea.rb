class Idea < ApplicationRecord
  # mount_uploader :picture, PictureUploader
  has_one_attached :picture
  has_rich_text :content

  has_many :comments
end
