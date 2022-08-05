class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :expenses, dependent: :destroy

  validates_presence_of :author
  validates :name, presence: true, length: { maximum: 30 }
  validates :icon, presence: true

  def total
    sum = 0
    expenses.each do |exp|
      sum += exp.amount
    end
    sum
  end
end
