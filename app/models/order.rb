class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :status

  has_many :items
  has_many :games, through: :items
end
