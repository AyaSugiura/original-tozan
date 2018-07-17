class Manager < ApplicationRecord
  has_secure_password
  
  has_many :mountains
  has_many :galleries
end
