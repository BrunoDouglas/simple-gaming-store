# Addresss Model
class Address < ApplicationRecord
  belongs_to :province

  validates :city, presence: true
  validates :line1, presence: true
  validates :postal_code, presence: true, length: { in: 6..7 }

  def display_name
    line1
  end
end
