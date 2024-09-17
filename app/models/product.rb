class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :line_items
  has_many :orders, through: :line_items
end
