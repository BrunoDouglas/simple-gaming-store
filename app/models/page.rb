# Page Model
class Page < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
end
