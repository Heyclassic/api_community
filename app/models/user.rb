class User < ApplicationRecord
  has_secure_password

  has_many :products
  has_one_attached :avatar

  def avatar_path
    ActiveStorage::Blob.service.path_for(avatar.key) if avatar.attached?
  end
end
