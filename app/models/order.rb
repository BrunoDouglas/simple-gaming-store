# Order Model
class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :status

  has_many :items
  has_many :games, through: :items

  validates :order_date, presence: true

  def display_name
    "Order##{id} - Customer: #{customer.name}"
  end

  def total
    items.map { (x.price * x.quantity) }.sum
  end
end
