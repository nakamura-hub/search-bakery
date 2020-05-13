class Shop < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user_id, dependent: :destroy
  
  validates :name, :address, :station_name, :open, :close, presence: true
  
  # [メソッド]
  #  search  検索メソッド
  #
  # [引数]
  #  search_name     店名検索
  #  search_keyword  キーワード検索
  #
  # [処理概要]
  #  引数で受け取った値をShopテーブルから探す
  # 
  def self.search(search_name, search_keyword)
    # search_nameとsearch_keyword両方値が入っている場合
    if (search_name.present?) && (search_keyword.present?)
      Shop.where('name LIKE(?)', "%#{search_name}%").where('address LIKE(?) OR station_name LIKE(?)', "%#{search_keyword}%", "%#{search_keyword}%")
    # search_nameの値が入っている場合
    elsif search_name.present?
      Shop.where('name LIKE(?)', "%#{search_name}%")
    # search_keywordの両方値が入っている場合
    elsif search_keyword.present?
      Shop.where('address LIKE(?) OR station_name LIKE(?)', "%#{search_keyword}%", "%#{search_keyword}%")
    # # search_nameとsearch_keyword両方値が入っていない場合
    else
       Shop.all
    end
  end
end
