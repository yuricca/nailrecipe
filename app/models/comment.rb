class Comment < ApplicationRecord
  belongs_to :nail
  belongs_to :user

  validates :text, presence: true
end
