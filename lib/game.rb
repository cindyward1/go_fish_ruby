class Game

	attr_reader :players, :deck, :result, :winner

	def initialize

		@players = []
		@deck = Deck.new

	end


	def game_over

		plural = ""
		if @players[0].hand.cards.length == 0 || @players[1].hand.cards.length == 0 || @deck.cards.length == 0
			if @players[0].points > @players[1].points
				if @players[0].points > 1
					plural = "s"
				end
				the_winner = "#{@players[0].name} wins with #{@players[0].points} point#{plural}"
			elsif @players[0].points < @players[1].points
				if @players[1].points > 1
					plural = "s"
				end
				the_winner = "#{@players[1].name} wins with #{@players[1].points} point#{plural}"
			else
				if @players[0].points > 1
					plural = "s"
				end
				the_winner = "Tie between #{@players[0].name} and #{@players[1].name} with #{@players[0].points} point#{plural}"
			end

			return { :result=>true, :winner=>the_winner }

		end;

		return { :result=>false }

	end

end
