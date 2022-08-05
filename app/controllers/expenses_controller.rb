class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show destroy]

  def index
    @expenses = Expense.where(category_id: params['category_id']).order(created_at: :desc)
    @category = Category.find(params[:category_id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = Expense.new(expense_params)
    @expense.author_id = current_user.id
    @expense.category_id = @category.id

    if @expense.save
      redirect_to category_expenses_path, notice: 'Expense was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
