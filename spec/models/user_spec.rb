require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @chris = User.create(name: 'chris', email: 'chris@gmail.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    expect(@chris).to be_valid
  end

  it 'is invalid without an email' do
    @chris.email = nil
    expect(@chris).to_not be_valid
  end

  it 'is invalid without a password' do
    @chris.password = ''
    expect(@chris).to_not be_valid
  end

  it 'is invalid without a name' do
    @chris.name = nil
    expect(@chris).to_not be_valid
  end

  it 'is invalid if name length is more than 50 characters' do
    @chris.name = 'a' * 52
    expect(@chris).to_not be_valid
  end
end
