class Nail < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :detail
    validates :thumb
    validates :index_finger
    validates :middle_finger
    validates :ring_finger
    validates :little_finger
  end
  
  def self.search(search)
    if search != ""
      Nail.where('title LIKE(?)', "%#{search}%")
    else
      Nail.all
    end
  end
end
