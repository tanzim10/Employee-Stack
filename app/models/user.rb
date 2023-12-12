class User < ApplicationRecord
  has_secure_password
  #Validation for emails
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Enter a valid email address" }
  validates :email, case_sensitive: false
  #Validation for passwords
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :password, format: { with: /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W])/, message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character" }






end
