require 'rails_helper'

RSpec.describe User, type: :model do
  # Email validation tests
  context 'email validations' do
    it 'is valid with a valid email address' do
      user = User.new(email: 'tanzimfarhan@gmail.com', password: 'Tfra32r*')
      expect(user).to be_valid
    end

    it 'is invalid with a duplicate email address' do
      User.create(email: 'tanzimfarhan99@gmail.com', password: 'Tfra32r*')
      user = User.new(email: 'tanzimfarhan99@gmail.com', password: 'Tfra1023*')
      expect(user).not_to be_valid
    end

    it 'is invalid with an incorrect email format' do
      user = User.new(email: 'invalid_email', password: 'Tfra1023!')
      expect(user).not_to be_valid
    end

    it 'is not a valid email address' do
        user = User.new(email: 'not a valid email', password: 'Tfra32r2')
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include('Enter a valid email address')
      end
      
  end

  # Password validation tests
  context 'password validations' do
    it 'is valid with a password meeting all criteria' do
      user = User.new(email: 'tanzimfarhan@gmail.com', password: 'Tfra32*')
      expect(user).to be_valid
    end

    it 'is invalid with a short password' do
      user = User.new(email: 'test@example.com', password: 'Pass!')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'is invalid without a digit in the password' do
      user = User.new(email: 'test@example.com', password: 'Password!')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('must include at least one lowercase letter, one uppercase letter, one digit, and one special character')
    end

    
  end

end
