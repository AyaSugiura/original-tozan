class Mountain < ApplicationRecord
  belongs_to :manager
  
  validates :name, presence: true
  validates :area, presence: true
end
