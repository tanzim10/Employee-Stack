class Employee < ApplicationRecord

  # Validation for presence
  validates :first_name, :last_name, :email, :address, presence: true
      
  # Validation for email format and uniqueness
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
      
  # Validation for number (assuming it's a phone number or similar)
  validates :number, numericality: { only_integer: true }, allow_blank: true

      
      
      
end
