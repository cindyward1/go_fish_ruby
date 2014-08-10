class Card

	attr_reader :rank, :suit

	def initialize(attributes)
		@rank = attributes[:rank]
		@suit = attributes[:suit]
	end

	def == (another_card)
		self.rank == another_card.rank && self.suit == another_card.suit
	end
	
end
