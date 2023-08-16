class User<ApplicationRecord
    attr_accessor :full_name
    has_many :groups
    has_many :expenses
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length:{minimum: 6}
end