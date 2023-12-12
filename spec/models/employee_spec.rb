require 'rails_helper'


RSpec.describe Employee, type: :model do
  # Test for presence validations
  it 'is valid with valid attributes' do
    employee = Employee.new(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', number: 123456, address: '123 Main St')
    expect(employee).to be_valid
  end

  it 'is not valid without a first name' do
    employee = Employee.new(first_name: nil)
    expect(employee).not_to be_valid
  end



  # Test for unique email
  it 'is not valid if the email is taken' do
    Employee.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@example.com', number: 123456, address: '123 Main St')
    employee = Employee.new(first_name: 'John', last_name: 'Doe', email: 'jane.doe@example.com', number: 654321, address: '456 Elm St')
    expect(employee).not_to be_valid
  end



end
