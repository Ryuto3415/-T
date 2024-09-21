class Train < ApplicationRecord
  belongs_to :user
  has_many :train_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # 画像の登録
  has_one_attached :image
  # バリデーション
  validates :title,prensence: true
  validates :body,prensence: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
