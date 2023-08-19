require 'rails_helper'

RSpec.describe 'Expense index page', type: :feature do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'John Kingston', email: 'john@gmail.com', password: 'John@2022',
                        password_confirmation: 'John@2022')
    @group = Group.create(name: 'Food', icon: 'food-icon.svg', author: @user)
    @expense = Expense.create(name: 'Tasty cheff', amount: 20, author: @user)
    @group.expenses << @expense

    sign_in @user
    visit user_group_expenses_path(@user.id, @group.id)
  end

  it 'Displays category name' do
    expect(page).to have_content(@group.name)
  end

  it 'Displays expense name' do
    expect(page).to have_content(@expense.name)
  end

  it 'Displays transactions text' do
    expect(page).to have_content('TRANSACTIONS')
  end

  it 'Displays Add New Transection text' do
    expect(page).to have_content('Add new transaction')
  end

  it 'Calculate the total' do
    expect(page).to have_content(@group.expenses.sum(:amount))
  end
end
