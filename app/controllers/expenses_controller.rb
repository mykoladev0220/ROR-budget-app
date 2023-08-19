class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @group = Group.find(params[:group_id])
    @expenses = @user.expenses.joins(:groups).where(groups: { id: @group.id }).where(author_id: @user.id)
  end

  def new
    @group_id = Group.find(params[:group_id])
    @group = Group.where(author_id: current_user.id)
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(set_expense_params)

    @group = Group.find(params[:group_id])
    @expense.save

    @group.expenses << @expense

    redirect_to user_group_expenses_path, notice: 'Expense was successfully created'
  end

  def set_expense_params
    params.require(:expense).permit(:name, :amount).merge(author_id: current_user.id)
  end
end
