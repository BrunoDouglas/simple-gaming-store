class Item < ApplicationRecord
  belongs_to :order
  belongs_to :game
end
