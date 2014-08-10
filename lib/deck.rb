class Deck

	attr_reader :cards

	@@suit_hash = { 1=>"Clubs", 2=>"Diamonds", 3=>"Hearts", 4=>"Spades" }

	def initialize
		@cards = []
	end

	def fill # this method produces a 1-dimensional array of cards from the 2 nested for loops

		for index_suit in (1..4)
			for index_rank in (2..14)
				@cards << Card.new({:rank=>index_rank, :suit=>@@suit_hash[index_suit]})
			end
		end

	end


	def shuffle # this method uses the modern Durstenfeld algorithm to shuffle the deck

		(@cards.length-1).downto(1) do |index1| 
	  	index2 = rand(index1)
	    @cards[index1], @cards[index2] = @cards[index2], @cards[index1]
	  end

	end


	def deal_top_card

			return (@cards.delete_at(0))

	end

end