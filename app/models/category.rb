class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :expenses

  def total
    sum = 0
    expenses.each do |exp|
      sum += exp.amount
    end
    sum
  end
end
