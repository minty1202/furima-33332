class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true,
                        length: { minimum: 3, maximum: 15 }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
  # format: { with:  }
  # format: { with: /\A[ァ-ヶー－]+\z/ }
  # format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  # /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  # /\A[ぁ-んァ-ン一-龥]/
  # /\A[ァ-ヶー－]+\z/

end
