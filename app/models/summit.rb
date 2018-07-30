class Summit < ApplicationRecord
  belongs_to :manager
  
  validates :manager_id, presence: true
  validates :image, presence: true
  validates :comment, presence: true
  
  mount_uploader :image, GalleryUploader
end
