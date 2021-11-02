class Comment < ApplicationRecord
  belomgs_to :nail
  belomgs_to :user

  validates :text, presence: true
end
