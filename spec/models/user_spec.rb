require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(email: 'john@gmail.com', password: 'password')
    @user_two = User.new(name: 'John Kingston', password: 'password')
    @user_three = User.new(name: 'John Kingston', email: 'john@gmail.com')
    @correct_user = User.new(name: 'John Kingston', email: 'john@gmail.com', password: 'John@2022')
  end
  context 'Validation tests' do
    it 'should not save user without name' do
      expect(@user.save).to be_falsey
    end

    it 'should not save user without email' do
      expect(@user_two.save).to be_falsey
    end

    it 'should not save user without email' do
      expect(@user_three.save).to be_falsey
    end

    it 'should save with all provided fields' do
      expect(@correct_user.save).to be_truthy
    end
  end

  context 'Association tests' do
    it 'has many categories' do
      user = User.reflect_on_association(:groups)
      expect(user.macro).to eq :has_many
    end
    it 'has many transactions' do
      user = User.reflect_on_association(:expenses)
      expect(user.macro).to eq :has_many
    end
  end
end
