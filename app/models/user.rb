class User < ApplicationRecord
  attr_accessor :full_name

  has_many :groups, foreign_key: 'author_id'
  has_many :expenses, foreign_key: 'author_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
