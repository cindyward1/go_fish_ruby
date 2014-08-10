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
		test_card = Card.new({:rank=>2,:suit=>"Clubs"})
		expect(test_deck.cards[0]).to eq test_card
	end

	it "can shuffle its cards randomly" do
		test_deck = Deck.new
		test_deck.fill
		test_card = test_deck.cards[0]
		test_deck.shuffle
		expect(test_deck.cards[0]).not_to eq test_card
	end

	it "can deal the top card" do
		test_deck = Deck.new
		test_deck.fill
		test_deck.shuffle
		test_card = test_deck.cards[0]
		test_length = test_deck.cards.length
		top_card = test_deck.deal_top_card
		expect(top_card).to eq test_card
		expect(top_card).not_to eq test_deck.cards[0]
		expect(test_deck.cards.length).to eq (test_length-1)
	end

end

