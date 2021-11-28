class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :nail

  validates_uniqueness_of :nail_id, scope: :user_id
end
