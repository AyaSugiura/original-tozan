class Information < ApplicationRecord
  belongs_to :manager
  
  validates :manager_id, presence: true
  validates :content, presence: true, length: { maximum: 50 }
end
