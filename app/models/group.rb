class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :expenses, join_table: 'groups_expenses'
  # has_many :group_expenses
  # has_many :expenses, through: :group_expenses
end
