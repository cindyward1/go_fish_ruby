class Card

	attr_reader :rank, :suit

	def initialize(attributes)
		@rank = attributes[:rank]
		@suit = attributes[:suit]
	end

end
