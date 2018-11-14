# Item Model
class Item < ApplicationRecord
  belongs_to :order
  belongs_to :game

  validates :price, presence: true, numericality: true
  validates :gst, presence: true, numericality: true
  validates :pst, presence: true, numericality: true
end
