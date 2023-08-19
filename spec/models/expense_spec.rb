require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :each do
    @user = User.create(name: 'John Kingston', email: 'john@gmail.com', password: 'John@2022')
    @group = Group.new(name: 'Transport', icon: 'transport-image.png', author_id: @user.id)
    @expense = Expense.new(name: 'Mercedes benz', amount: 2000, author_id: @user.id)
    @expense_two = Expense.new(name: 'Mercedes benz', author_id: @user.id)
    @expense_three = Expense.new(amount: 2000, author_id: @user.id)
  end
  context 'Validation tests' do
    it 'should not save category without name' do
      expect(@expense_two.save).to be_falsey
    end

    it 'should not save category without icon' do
      expect(@expense_three.save).to be_falsey
    end

    it 'should save with all provided fields' do
      expect(@expense.save).to be_truthy
    end
  end

  context 'Association tests' do
    it 'belongs to user' do
      expense = Expense.reflect_on_association(:author)
      expect(expense.macro).to eq :belongs_to
    end
    it 'has belongs to many groups' do
      expense = Expense.reflect_on_association(:groups)
      expect(expense.macro).to eq :has_and_belongs_to_many
    end
  end
end
