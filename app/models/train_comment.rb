class TrainComment < ApplicationRecord
  belongs_to :user
  belongs_to :train
  validates :comment, presence: true # コメント何文字までにすればいい？
end
