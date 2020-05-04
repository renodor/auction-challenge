class ChangeAuctionPriceDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :auctions, :auction_price, 0
  end
end
