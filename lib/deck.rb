class Deck

	attr_reader :cards

	@@suit_hash = {1=>"Clubs", 2=>"Diamonds", 3=>"Hearts", 4=>"Spades"}
	@@rank_hash = {11=>"Jack", 12=>"Queen", 13=>"King", 14=>"Ace"}

	def initialize
		@cards = []
	end

	def fill # this method produces a 1-dimensional array of cards from the 2 nested for loops

		for index_suit in (1..4)
			for index_rank in (2..14)
				if index_rank < 11
					@cards << Card.new({:rank=>index_rank.to_s, :suit=>@@suit_hash[index_suit]})
				else
					@cards << Card.new({:rank=>@@rank_hash[index_rank], :suit=>@@suit_hash[index_suit]})
				end
			end
		end

	end


	def shuffle # this method uses the modern Durstenfeld algorithm to shuffle the deck

		51.downto(1) do |index1| 
	  	index2 = rand(index1)
	    @cards[index1], @cards[index2] = @cards[index2], @cards[index1]
	  end

	end

end