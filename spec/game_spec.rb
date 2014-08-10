require "rspec"
require "game"
require "player"
require "hand"
require "deck"
require "card"

describe Game do

	it "is initialized with an empty deck and no players" do
		test_game = Game.new
		expect(test_game).to be_an_instance_of Game
		expect(test_game.players).to eq []
		expect(test_game.deck.cards).to eq []
	end

	it "is over when a player has no cards left" do
		test_game = Game.new
		test_game.deck.fill
		test_player = Player.new({:name=>"Cindy"})
		test_player.award_point
		test_game.players << test_player
		test_player = Player.new({:name=>"Steve"})
		test_card = Card.new({:rank=>"2",:suit=>"Clubs"})
		test_player.hand.cards << test_card
		test_game.players << test_player
		expect(test_game.game_over[:result]).to eq true
		expect(test_game.game_over[:winner]).to eq "Cindy wins with 1 point"
	end

	it "is over when the deck has no cards left" do
		test_game = Game.new
		test_player = Player.new({:name=>"Cindy"})
		test_card = Card.new({:rank=>"2",:suit=>"Hearts"})
		test_player.hand.cards << test_card
		test_player.award_point
		test_game.players << test_player
		test_player = Player.new({:name=>"Steve"})
		test_card = Card.new({:rank=>"2",:suit=>"Clubs"})
		test_player.hand.cards << test_card
		test_game.players << test_player
		expect(test_game.game_over[:result]).to eq true
		expect(test_game.game_over[:winner]).to eq "Cindy wins with 1 point"
	end

end
