class Manager < ApplicationRecord
  has_secure_password
  
  has_many :mountains
  has_many :galleries
  has_many :information
  has_many :summits
end
