require 'test_helper'

class AuctionBiddingTest < ActionDispatch::IntegrationTest
  def setup
    @auction = auctions(:auction1)
  end

  test "bid method should update auction bidding price" do
    patch bid_auction_path(@auction), params: { auction: { auction_price: 20 } }
    assert_equal(flash.notice, "You proposed a new bid for this auction!")
    @auction.reload
    assert_equal @auction.auction_price, 20
    assert_redirected_to @auction
  end

  test "you can't bid lower than the current bidding price" do
    patch bid_auction_path(@auction), params: { auction: { auction_price: 5 } }
    assert_equal flash.alert, "Bidding must be higher than current auction price"
    @auction.reload
    assert_equal @auction.auction_price, 15.5
    assert_redirected_to @auction
  end

  test "by default you bid 1$ higher than the current bidding price" do
    get auction_path(@auction)
    assert_select ".bidding-form #auction_auction_price"
    assert_select("#auction_auction_price[value='#{@auction.auction_price + 1}']")
  end

  test "if bidding price is higher than original price, original price is crossed" do
    get auction_path(@auction)
    assert_select ".crossed-text"
    @auction.update(price: 100)
    get auction_path(@auction)
    assert_select ".crossed-text", false
  end
end
