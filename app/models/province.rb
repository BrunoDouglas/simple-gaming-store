class Province < ApplicationRecord
  validates :name, presence: true
  validates :tax_percent, presence: true, numericality: true
end
