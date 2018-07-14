class Manager < ApplicationRecord
  has_secure_password
  
  has_many :mountains
end
