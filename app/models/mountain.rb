class Mountain < ApplicationRecord
  belongs_to :manager
  
  validates :manager_id, presence: true
  validates :name, presence: true
  validates :area, presence: true
end
