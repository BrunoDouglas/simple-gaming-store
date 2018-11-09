# Province Model
class Province < ApplicationRecord
  validates :name, presence: true
  validates :gst, presence: true, numericality: true
  validates :pst, presence: true, numericality: true
end
