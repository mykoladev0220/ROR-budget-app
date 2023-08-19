require 'rails_helper'

RSpec.describe 'categories index page', type: :feature do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'John Kingston', email: 'john@gmail.com', password: 'John@2022',
                        password_confirmation: 'John@2022')
    @group = Group.create(name: 'Food', icon: 'food-icon.svg', author: @user)

    sign_in @user
    visit user_groups_path(@group.id)
  end

  it 'Shows category name' do
    expect(page).to have_content(@group.name)
  end

  it 'Shows transaction text' do
    expect(page).to have_content('Food')
  end

  it 'Calculate the total of transactions' do
    expect(page).to have_content(@group.expenses.sum(:amount))
  end

  it 'Can visit details page of a category link' do
    visit user_group_expenses_path(@user.id, @group.id)
    expect(page).to have_content('TRANSACTIONS')
  end
end
