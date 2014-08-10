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

end
