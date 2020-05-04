class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])
    if @auction.update(auction_params)
      redirect_to auction_path(@auction)
    else
      render :edit
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy
    redirect_to root_path
  end


  private

  def auction_params
    params.require(:auction).permit(:title, :content, :price)
  end
end
