class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :nails
  has_many :comments

  validates :nickname, presence: true

end
