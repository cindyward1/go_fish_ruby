require "rspec"
require "deck"
require "hand"
require "card"

describe Hand do

	it "is initially an empty array" do
		test_hand = Hand.new
		expect(test_hand.cards).to eq []
	end

	it "is dealt the top card from the deck" do
		test_hand = Hand.new
		test_deck = Deck.new
		test_deck.fill
		test_deck.shuffle
		test_card = test_deck.deal_top_card(test_hand)
		expect(test_hand.cards[0]).to eq test_card
		expect(test_deck.cards[0]).not_to eq test_card
	end

end
