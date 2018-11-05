# Customer Model
class Customer < ApplicationRecord
  belongs_to :credential
  belongs_to :address

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :phone, presence: true, numericality: { only_integer: true }
end
