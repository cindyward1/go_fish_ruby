require "rspec"
require "deck"
require "card"

describe Deck do

	it "is initially an empty array" do
		test_deck = Deck.new
		expect(test_deck.cards).to eq []
	end

	it "is filled with 52 unique cards" do
		test_deck = Deck.new
		test_deck.fill
		test_card = Card.new({:rank=>"2",:suit=>"Clubs"})
		expect(test_deck.cards[0]).to eq test_card
	end

	it "can shuffle its cards randomly" do
		test_deck = Deck.new
		test_deck.fill
		test_card = test_deck.cards[0]
		test_deck.shuffle
		expect(test_deck.cards[0]).not_to eq test_card
	end


end

