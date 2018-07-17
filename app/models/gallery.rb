class Gallery < ApplicationRecord
  belongs_to :manager
  
  validates :manager_id, presence: true
  validates :image, presence: true
  validates :name, presence: true
  
  mount_uploader :image, ImageUploader
end
