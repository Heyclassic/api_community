class User < ApplicationRecord
  has_secure_password

  has_many :products
  has_one_attached :avatar
end
