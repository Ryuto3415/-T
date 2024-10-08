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
  
  def self.search_for(content, method)
    if method == 'perfect'
      Train.where(title: content)
    elsif method == 'forward'
      Train.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Train.where('title LIKE ?', '%'+content)
    else
      Train.where('title LIKE ?', '%'+content+'%')
    end
  end
  
end
