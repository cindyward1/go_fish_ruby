class Game

	attr_reader :players, :deck

	def initialize

		@players = []
		@deck = Deck.new

	end

end
