# Auction Challenge

This is a simple auction app built with Ruby on Rails

## Auctions
Each auctions have a title, a content, a price and an 'auction price' (which is the highest currently bidding price)

## Basic Features
- Users can list, view, create, update and delete auctions (there is currently no authentication and authorization system, meaning that everybody can proceed CRUD actions on all auctions)
- Users can search auctions

## Bidding Feature
On an auction page, users can propose a new bid:
- You can propose a bid lower than the original price (if you consider that the original price defined by the owner of the auction is too high)
- But you can't propose a bid lower than the current bidding price

## Seeds
There are currently 10 pre-created auctions seeds using [Faker](https://github.com/faker-ruby/faker)

