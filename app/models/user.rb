class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_secure_password

  has_many :products
  has_many :comments
  has_one_attached :avatar

  def avatar_path
    rails_blob_path(avatar, only_path: true) if avatar.attached?
  end
end
