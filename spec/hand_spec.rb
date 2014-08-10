require "rspec"
require "deck"
require "hand"
require "card"

describe Hand do

	it "is initially an empty array" do
		test_hand = Hand.new
		expect(test_hand.cards).to eq []
	end

	it "is dealt the top card from the deck and puts it in its hand" do
		test_hand = Hand.new
		test_deck = Deck.new
		test_deck.fill
		test_deck.shuffle
		test_card = test_deck.deal_top_card
		dealt_cards = []
		dealt_cards << test_card
		test_hand.put_cards_in_hand(dealt_cards)
		expect(test_hand.cards[0]).to eq test_card
		expect(test_deck.cards[0]).not_to eq test_card
	end

	it "sorts itself in rank order" do
		test_hand = Hand.new
		test_card1 = Card.new({:rank=>5, :suit=>"Hearts"})
		test_hand.cards << test_card1
		test_card2 = Card.new({:rank=>5, :suit=>"Clubs"})
		test_hand.cards << test_card2
		test_card3 = Card.new({:rank=>3, :suit=>"Clubs"})
		test_hand.cards << test_card3
		test_card4 = Card.new({:rank=>2, :suit=>"Hearts"})
		test_hand.cards << test_card4
		test_hand.sort_hand
		expect(test_hand.cards[0]).to eq test_card4
		expect(test_hand.cards[1]).to eq test_card3
		expect(test_hand.cards[2]).to eq test_card2
		expect(test_hand.cards[3]).to eq test_card1
	end

	it "determines if it doesn't have a book of cards (4 cards of the same rank)" do
		test_hand = Hand.new
		test_card1 = Card.new({:rank=>5, :suit=>"Hearts"})
		test_hand.cards << test_card1
		expect(test_hand.book_of_rank(test_card1)).to eq 0
		expect(test_hand.cards.length).to eq 1
		test_card2 = Card.new({:rank=>5, :suit=>"Clubs"})
		test_hand.cards << test_card2
		expect(test_hand.book_of_rank(test_card2)).to eq 0
		expect(test_hand.cards.length).to eq 2
		test_card3 = Card.new({:rank=>3, :suit=>"Clubs"})
		test_hand.cards << test_card3
		expect(test_hand.book_of_rank(test_card3)).to eq 0
		expect(test_hand.cards.length).to eq 3
		test_card4 = Card.new({:rank=>2, :suit=>"Hearts"})
		test_hand.cards << test_card4
		expect(test_hand.book_of_rank(test_card4)).to eq 0
		expect(test_hand.cards.length).to eq 4
	end

	it "determines if it has a book of cards (4 cards of the same rank)" do
		test_hand = Hand.new
		test_card1 = Card.new({:rank=>2, :suit=>"Hearts"})
		test_hand.cards << test_card1
		expect(test_hand.book_of_rank(test_card1)).to eq 0
		test_card2 = Card.new({:rank=>2, :suit=>"Diamonds"})
		test_hand.cards << test_card2
		expect(test_hand.book_of_rank(test_card2)).to eq 0
		test_card3 = Card.new({:rank=>2, :suit=>"Clubs"})
		test_hand.cards << test_card3
		expect(test_hand.book_of_rank(test_card3)).to eq 0
		test_card4 = Card.new({:rank=>2, :suit=>"Spades"})
		test_hand.cards << test_card4
		expect(test_hand.book_of_rank(test_card4)).to eq 2
		expect(test_hand.cards.length).to eq 0
	end

	it "finds and creates an array of cards of requested rank, deleting them from the hand" do
		test_hand = Hand.new
		test_card1 = Card.new({:rank=>5, :suit=>"Hearts"})
		test_hand.cards << test_card1
		test_card2 = Card.new({:rank=>5, :suit=>"Clubs"})
		test_hand.cards << test_card2
		test_card3 = Card.new({:rank=>3, :suit=>"Clubs"})
		test_hand.cards << test_card3
		test_card4 = Card.new({:rank=>2, :suit=>"Hearts"})
		test_hand.cards << test_card4
		found_cards = test_hand.find_in_hand(5, true)
		expect(found_cards.length).to eq 2
		expect(found_cards[0]).to eq test_card1
		expect(found_cards[1]).to eq test_card2
		expect(test_hand.cards.length).to eq 2
	end

	it "returns an empty array if the hand contains no cards of requested rank" do
		test_hand = Hand.new
		test_card1 = Card.new({:rank=>5, :suit=>"Hearts"})
		test_hand.cards << test_card1
		test_card2 = Card.new({:rank=>5, :suit=>"Clubs"})
		test_hand.cards << test_card2
		test_card3 = Card.new({:rank=>3, :suit=>"Clubs"})
		test_hand.cards << test_card3
		test_card4 = Card.new({:rank=>2, :suit=>"Hearts"})
		test_hand.cards << test_card4
		found_cards = test_hand.find_in_hand(14, true)
		expect(found_cards).to eq []
		expect(test_hand.cards.length).to eq 4
	end

	it "determines whether a card number may be requested" do
		test_hand = Hand.new
		test_card1 = Card.new({:rank=>5, :suit=>"Hearts"})
		test_hand.cards << test_card1
		expect(test_hand.valid_card_to_request?("5")[:result]).to eq true
		expect(test_hand.valid_card_to_request?("5")[:rank]).to eq 5
		expect(test_hand.valid_card_to_request?("jack")[:result]).to eq false
		expect(test_hand.valid_card_to_request?("jack")[:reason]).to eq "You do not have that card in your hand"
		expect(test_hand.valid_card_to_request?("0")[:result]).to eq false
		expect(test_hand.valid_card_to_request?("0")[:reason]).to eq "Invalid card number"
	end

end
