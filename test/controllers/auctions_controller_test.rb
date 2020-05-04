require 'test_helper'

class AuctionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @auction = auctions(:auction1)
  end

  test "should get index" do
    get auctions_path
    assert_response :success
  end

  test "should get show" do
    get auction_path(@auction)
    assert_response :success
  end

  test "should get new" do
    get new_auction_path
    assert_response :success
  end

  test "should get edit" do
    get edit_auction_path(@auction)
    assert_response :success
  end

  test "update auction" do
    patch auction_path(@auction), params: { auction: { title: "new title" } }
    @auction.reload
    assert_equal(@auction.title, "new title")
    assert_redirected_to @auction
  end

  test "create auction" do
    assert_difference 'Auction.count', 1 do
      post auctions_path, params: { auction: { title: "new auction", content: "content", price: 100 } }
    end
  end

  test "delete auction" do
      assert_difference 'Auction.count', -1 do
      delete auction_path(@auction)
    end
    assert_redirected_to root_path
  end
end
