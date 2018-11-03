class Customer < ApplicationRecord
  belongs_to :credential
  belongs_to :address
end
