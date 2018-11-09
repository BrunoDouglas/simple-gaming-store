# Platform Model
class Platform < ApplicationRecord
  #has_many :game, dependent: :delete_all
  validates :name, presence: true
end
