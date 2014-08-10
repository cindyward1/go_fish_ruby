class Hand
	
	attr_reader :cards

	def initialize
		@cards = []
	end


	def sort_hand
		@cards.sort_by! { |card| [card.rank, card.suit] }
	end


	def find_in_hand(rank)
		cards_to_give_up = []

		@cards.each do |card_in_hand|
			if card_in_hand.rank == rank
				cards_to_give_up << card_in_hand
			end
		end

		if cards_to_give_up != []
			@cards.delete_if { |card_found| card_found.rank == rank }
		end

		return cards_to_give_up

	end


	def book_of_rank

		sort_hand

		book_rank = { :rank=>0, :count=>0 }
		@cards.each do |card_in_hand|
			if book_rank[:rank] == card_in_hand.rank
				book_rank[:count] += 1
				if book_rank[:count] == 4
					@cards.delete_if { |book_of_found| book_of_found.rank == book_rank[:rank] }
					return book_rank[:rank] # found and deleted a book of book_rank[0] from hand
				end
			else
				book_rank[:rank] = card_in_hand.rank
				book_rank[:count] = 1
			end
		end

		return 0 # did not find a book in the hand

	end

end