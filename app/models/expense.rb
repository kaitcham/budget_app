class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category

  validates_presence_of :name, :amount, :author, :category
end
