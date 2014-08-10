class Hand
	
	attr_reader :cards

	def initialize
		@cards = []
	end


	def sort_hand
		@cards.sort_by! { |card| [card.rank, card.suit] }
	end


	def put_cards_in_hand(card_array)

		card_array.each do |card|
			@cards << card
		end

		if @cards.length > 1
			self.sort_hand
		end

	end


	def find_in_hand(rank, cards_to_be_deleted)

		cards_to_delete = []

		@cards.each do |card_in_hand|
			if card_in_hand.rank == rank
				cards_to_delete << card_in_hand
			end
		end

		if cards_to_delete != [] && cards_to_be_deleted
			@cards.delete_if { |card_found| card_found.rank == rank }
		end

		return cards_to_delete

	end


	def book_of_rank(new_card) # needs to be run after every time a player gets a new card from any source
		
		found_cards = self.find_in_hand(new_card.rank, false)

		if found_cards.length == 4
			@cards.delete_if { |book_of_found| book_of_found.rank == new_card.rank }
			return new_card.rank # found a book of returned rank in the hand
		else
			return 0 # did not find a book in the hand
		end

	end

end