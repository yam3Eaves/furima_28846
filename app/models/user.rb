class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options  presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    # validates :first_name, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday 
  end
end

