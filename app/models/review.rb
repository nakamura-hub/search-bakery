class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  
  validates :message, presence: true, length: {maximum: 255}
end
