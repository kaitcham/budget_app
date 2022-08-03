require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @chris = User.create(name: 'chris', email: 'chris@gmail.com', password: '123456')
    expect(@chris).to be_valid
    @cars = Category.create(name: 'cars', icon: 'C', author_id: @chris.id)
    expect(@cars).to be_valid
    @benz = Expense.create(name:'benz', amount: 1000, author_id: @chris.id, category_id: @cars.id)
  end

  after(:each) do
    User.destroy_all
    Category.destroy_all
    Expense.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@benz).to be_valid
  end

  it 'is invalid without a name' do
    @benz.name = nil
    expect(@benz).to_not be_valid
  end

  it 'is invalid without amount' do
    @benz.amount = nil
    expect(@benz).to_not be_valid
  end

  it 'is invalid without author' do
    @benz.author_id = nil
    expect(@benz).to_not be_valid
  end

  it 'is invalid without category' do
    @benz.category_id = nil
    expect(@benz).to_not be_valid
  end
end