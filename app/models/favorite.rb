class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :train
  validates :user_id, uniqueness: {scope: :tra_id}
end
