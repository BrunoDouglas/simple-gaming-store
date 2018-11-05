# Email Validator
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || 'is not an email') unless value.match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
  end
end
# Credential Model
class Credential < ApplicationRecord
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, length: { in: 3..20 }
  def display_name
    email
  end
end
