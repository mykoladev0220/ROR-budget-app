class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :expenses, join_table: 'groups_expenses'
 

  validates :name, presence: true
  validates :icon, presence: true    
end
