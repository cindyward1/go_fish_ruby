class Card

	attr_reader :rank, :suit

	def initialize(attributes)
		@rank = attributes[:rank]
		@suit = attributes[:suit]
	end

	def == (another_card)
		self.rank == another_card.rank && self.suit == another_card.suit
	end

	def print

		suit_symbol_hash = { "Clubs"=>"\u2663","Diamonds"=>"\u2666", "Hearts"=>"\u2665", "Spades"=>"\u2660" }
		rank_hash = { 11=>"Jack", 12=>"Queen", 13=>"King", 14=>"Ace" }

		if @rank < 11
			return "#{@rank.to_s} of #{suit_symbol_hash[@suit]}"
		else
			return "#{rank_hash[@rank]} of #{suit_symbol_hash[@suit]}"
		end

	end

end
