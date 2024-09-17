class Order < ApplicationRecord
  has_many :line_items
  has_many :products, through: :line_items
  has_many :order_items
  has_many :products, through: :order_items
end
