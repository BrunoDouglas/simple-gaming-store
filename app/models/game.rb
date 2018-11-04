class Game < ApplicationRecord
  belongs_to :platform

  has_many :items
  has_many :orders, through: :items

  validates :name, presence: true
  validates :price, presence: true,  numericality: true
  validates :image, presence: true

end
