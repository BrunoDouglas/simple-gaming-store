class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :status

  has_many :items
  has_many :games, through: :items

  validates :order_date, presence: true

  def display_name
    "Order##{self.id} - Customer: #{customer.name}"
  end
end
