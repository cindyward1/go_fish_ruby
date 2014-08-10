class Player

	attr_reader :name, :hand, :points

	def initialize(attributes)

		@name = attributes[:name]
		@hand = Hand.new
		@points = 0

	end

	def award_point
		@points += 1
	end


end