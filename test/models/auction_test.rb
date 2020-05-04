require 'test_helper'

class AuctionTest < ActiveSupport::TestCase
  def setup
    @auction = auctions(:auction1)
  end

  test 'valid auction' do
    assert @auction.valid?
  end

  test 'auction should have a title' do
    @auction.title = ''
    assert_not @auction.valid?
  end

  test 'auction should have a content' do
    @auction.content = ''
    assert_not @auction.valid?
  end

  test 'auction should have a price' do
    @auction.price = ''
    assert_not @auction.valid?
  end

  test 'auction original price should be a number greater or equal to zero' do
    @auction.price = 'price'
    assert_not @auction.valid?
    @auction.price = -1
    assert_not @auction.valid?
    @auction.price = 0
    assert @auction.valid?
  end

  test 'auction bid price should be a number greater or equal to zero' do
    @auction.auction_price = 'price'
    assert_not @auction.valid?
    @auction.auction_price = -1
    assert_not @auction.valid?
    @auction.auction_price = 0
    assert @auction.valid?
  end

  test 'auction bid price should be 0 by default' do
    auction = Auction.new
    assert_equal auction.auction_price, 0
  end
end
