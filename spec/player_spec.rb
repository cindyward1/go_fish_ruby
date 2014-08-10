require "rspec"
require "deck"
require "hand"
require "card"
require "player"

describe Player do
	
	it "is initialized with a name, an empty hand, and no points" do
		test_player = Player.new({:name=>"Cindy"})
		expect(test_player.name).to eq "Cindy"
		expect(test_player.hand.cards).to eq []
		expect(test_player.points).to eq 0
	end

	it "is dealt the top card from the deck into its hand" do
		test_player = Player.new({:name=>"Cindy"})
		test_deck = Deck.new
		test_card1 = Card.new({:rank=>5, :suit=>"Hearts"})
		test_deck.cards << test_card1
		test_card2 = Card.new({:rank=>5, :suit=>"Clubs"})
		test_deck.cards << test_card2
		test_dealt_card = test_deck.deal_top_card
		dealt_cards = []
		dealt_cards << test_dealt_card
		test_player.hand.put_cards_in_hand(dealt_cards)
		expect(test_dealt_card).to eq test_card1
		expect(test_player.hand.cards[0]).to eq test_card1
	end

	it "takes all of the cards of a given rank from another player and puts them in its hand" do
		test_player1 = Player.new({:name=>"Cindy"})
		test_player2 = Player.new({:name=>"Steve"})
		test_card1 = Card.new({:rank=>5, :suit=>"Hearts"})
		test_player2.hand.cards << test_card1
		test_card2 = Card.new({:rank=>5, :suit=>"Clubs"})
		test_player2.hand.cards << test_card2
		test_card3 = Card.new({:rank=>3, :suit=>"Clubs"})
		test_player2.hand.cards << test_card3
		test_card4 = Card.new({:rank=>2, :suit=>"Hearts"})
		test_player2.hand.cards << test_card4
		found_cards = test_player2.hand.find_in_hand(5, true)
		test_player1.hand.put_cards_in_hand(found_cards)
		expect(test_player1.hand.cards.length).to eq 2
		expect(test_player2.hand.cards.length).to eq 2		
	end

	it "is awarded a point if a if it has a book of cards (4 cards of the same rank)" do
		test_player = Player.new({:name=>"Cindy"})
		test_card1 = Card.new({:rank=>2, :suit=>"Hearts"})
		test_player.hand.cards << test_card1
		expect(test_player.hand.book_of_rank(test_card1)).to eq 0
		test_card2 = Card.new({:rank=>2, :suit=>"Diamonds"})
		test_player.hand.cards << test_card2
		expect(test_player.hand.book_of_rank(test_card2)).to eq 0
		test_card3 = Card.new({:rank=>2, :suit=>"Clubs"})
		test_player.hand.cards << test_card3
		expect(test_player.hand.book_of_rank(test_card3)).to eq 0
		test_card4 = Card.new({:rank=>2, :suit=>"Spades"})
		test_player.hand.cards << test_card4
		expect(test_player.hand.book_of_rank(test_card4)).to eq 2
		test_player.award_point
		expect(test_player.hand.cards.length).to eq 0
		expect(test_player.points).to eq 1
	end

end
