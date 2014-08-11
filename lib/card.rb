class Card

	attr_reader :rank, :suit

	def initialize(attributes)
		@rank = attributes[:rank]
		@suit = attributes[:suit]
	end

	def == (another_card)
		self.rank == another_card.rank && self.suit == another_card.suit
	end

	def print(what_to_print)

		suit_symbols = { "Clubs"=>"\u2663","Diamonds"=>"\u2666", "Hearts"=>"\u2665", "Spades"=>"\u2660" }
		rank_face_cards = { 11=>"Jack", 12=>"Queen", 13=>"King", 14=>"Ace" }

		if what_to_print == "all"
			if @rank < 11
				return "#{@rank.to_s} of #{suit_symbols[@suit]}"
			else
				return "#{rank_face_cards[@rank]} of #{suit_symbols[@suit]}"
			end
		elsif what_to_print == "rank"
			if @rank < 11
				return "#{@rank.to_s}"
			else
				return "#{rank_face_cards[@rank]}"
			end
		end
	end

end
