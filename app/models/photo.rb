class Photo < ApplicationRecord
  belongs_to :mountain
  
  validates :image, presence: true 
  validates :mountain_id, presence: true
  
  mount_uploader :image, ImageUploader
end
