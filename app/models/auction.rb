class Auction < ApplicationRecord
  validates :title, :price, :content, presence: true
  validates :price, :auction_price, numericality: {greater_than_or_equal_to: 0}
end
