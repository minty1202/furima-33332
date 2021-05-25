class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, uniqueness: true,
                         length: { minimum: 2, maximum: 6 }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_day
  end
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }

  has_many :items
  has_one :orders
end
