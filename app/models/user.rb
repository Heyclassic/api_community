class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_secure_password
  has_secure_token

  has_many :products
  has_many :comments
  has_one_attached :avatar

  validates_uniqueness_of :email
  validates_presence_of :password_confirmation, on: :create, message: "can't be blank"

  def avatar_path
    rails_blob_path(avatar, only_path: true) if avatar.attached?
  end

  def invalidate_token
     update_columns(token: nil)
  end
end
