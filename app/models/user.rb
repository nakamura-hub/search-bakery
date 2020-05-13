class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :reviews, dependent: :destroy
  has_many :shops, through: :reviews, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_shops, through: :favorites, source: :shop, dependent: :destroy

  def favorite(other_shop)
    self.favorites.find_or_create_by(shop_id: other_shop.id)
  end

  def unfavorite(other_shop)
    favorite = self.favorites.find_by(shop_id: other_shop.id)
    favorite.destroy if favorite
  end

  def bookmark?(other_shop)
    self.favorite_shops.include?(other_shop)
  end
end
