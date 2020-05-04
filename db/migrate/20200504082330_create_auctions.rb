class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :title
      t.decimal :price
      t.decimal :auction_price
      t.text :content

      t.timestamps
    end
  end
end
