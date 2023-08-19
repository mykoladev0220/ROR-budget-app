require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(name: 'John Kingston', email: 'john@gmail.com', password: 'John@2022')
    @group = Group.new(name: 'Transport', icon: 'transport-image.png', author: @user)
    @group_two = Group.new(icon: 'transport-image.png', author: @user)
    @group_three = Group.new(name: 'Transport', author: @user)
  end
  context 'Validation tests' do
    it 'should not save category without name' do
      expect(@group_two.save).to be_falsey
    end

    it 'should not save category without icon' do
      expect(@group_three.save).to be_falsey
    end

    it 'should not save user without email' do
      expect(@group_three.save).to be_falsey
    end

    it 'should save with all provided fields' do
      expect(@group.save).to be_truthy
    end
  end

  # context "Total expense amount" do
  #     before do
  #         @expense_one = Expense.create(name:'Mercedes benz', amount:2000, author_id: @user.id)
  #         @expense_two = Expense.create(name:'Corolla S', amount:1200, author_id: @user.id)
  #         @group.expenses<<@expense_one
  #         @group.expenses<<@expense_two
  #     end

  #     it "returns the total expense for the group" do
  #         expect(@group.total_amount).to eq(3200)
  #     end

  # end

  context 'Association tests' do
    it 'has many categories' do
      group = Group.reflect_on_association(:author)
      expect(group.macro).to eq :belongs_to
    end
    it 'has many transactions' do
      group = Group.reflect_on_association(:expenses)
      expect(group.macro).to eq :has_and_belongs_to_many
    end
  end
end
