class Product < ApplicationRecord
  include Rails.application.routes.url_helpers
  acts_as_taggable
  belongs_to :user
  has_many :comments
  has_many_attached :images

  def images_paths
    images.map { |image| rails_blob_path(image, only_path: true) } if images.attached?
  end
end
