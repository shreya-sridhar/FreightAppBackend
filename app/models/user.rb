class User < ApplicationRecord
  has_many :drivers, class_name: "User", foreign_key: "driver_id"
  has_many :customers, class_name: "User", foreign_key: "customer_id"
  has_secure_password  
end

