class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :bike
  belongs_to :accessory
end
