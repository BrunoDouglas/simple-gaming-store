class Item < ApplicationRecord
  belongs_to :order
  belongs_to :game

  validates :price, presence: true, numericality: true

end
