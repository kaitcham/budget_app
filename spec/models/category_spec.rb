require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @chris = User.create(name: 'chris', email: 'chris@gmail.com', password: '123456')
    expect(@chris).to be_valid
    @cars = Category.create(name: 'cars', icon: 'C', author_id: @chris.id)
  end

  after(:each) do
    User.destroy_all
    Category.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@cars).to be_valid
  end

  it 'is invalid without a name' do
    @cars.name = nil
    expect(@cars).to_not be_valid
  end

  it 'is invalid without an icon' do
    @cars.icon = nil
    expect(@cars).to_not be_valid
  end

  it 'is invalid if name length is more than 30 characters' do
    @cars.name = 'a' * 40
    expect(@cars).to_not be_valid
  end
end