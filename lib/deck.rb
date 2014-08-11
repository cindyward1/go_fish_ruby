class Deck

	attr_reader :cards

	def initialize
		@cards = []
	end


	def fill

		suit_words = { 1=>"Clubs", 2=>"Diamonds", 3=>"Hearts", 4=>"Spades" }

		for index_suit in (1..4)
			for index_rank in (2..14)
				@cards << Card.new({:rank=>index_rank, :suit=>suit_words[index_suit]})
			end
		end

	end


	def shuffle

		(@cards.length-1).downto(1) do |index1| 
	  	index2 = rand(index1)
	    @cards[index1], @cards[index2] = @cards[index2], @cards[index1]
	  end

	end


	def deal_top_card

			return (@cards.delete_at(0))

	end

end