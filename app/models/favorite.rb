class Favorite < ApplicationRecord
  belongs_to :pastime
  belongs_to :user

  validates_uniqueness_of :pastime_id, scope: :user_id
end
