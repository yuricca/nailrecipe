class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :nails
  has_many :comments
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :profile
  end

  def already_favorited?(nail)
    self.favorites.exists?(nail_id: nail.id)
  end
end
