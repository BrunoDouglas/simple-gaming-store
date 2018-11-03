class Game < ApplicationRecord
  belongs_to :platform

  has_many :items
  has_many :orders, through: :items
end
