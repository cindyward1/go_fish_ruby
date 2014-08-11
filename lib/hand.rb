class Hand
	
	attr_reader :cards, :result, :reason, :rank

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

		cards_to_delete

	end


	def valid_card_to_request?(rank_string)

		face_cards_ranks = { "j"=>11, "q"=>12, "k"=>13, "a"=>14 }

		if rank_string.to_i == 0 && rank_string.length > 0 && face_cards_ranks.include?(rank_string.slice(0,1).downcase)
			rank = face_cards_ranks[rank_string.slice(0,1).downcase]
		else
			rank = rank_string.to_i
		end

		if rank < 2 || rank > 14
			return {:result=>false, :reason=>"Invalid card number"}
		elsif self.find_in_hand(rank, false).length == 0
			return {:result=>false, :reason=>"You do not have that card in your hand"}
		else
			return {:result=>true, :rank=>rank}
		end

	end


	def book_of_rank(new_card) # needs to be run after every time a player gets a new card from any source
		
		found_cards = self.find_in_hand(new_card.rank, false)

		if found_cards.length == 4
			@cards.delete_if { |book_of_found| book_of_found.rank == new_card.rank }
			return new_card.rank
		else
			return 0
		end

	end


	def print

		self.sort_hand

		@cards.each do |card|
			puts "  #{card.print("all")}"
		end

	end

end