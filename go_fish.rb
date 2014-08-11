require "./lib/game.rb"
require "./lib/deck.rb"
require "./lib/player.rb"
require "./lib/hand.rb"
require "./lib/card.rb"

def exit_program

	puts "\n"
	puts "Thanks for playing Go Fish!"
	puts "\n"
	exit

end


def get_player_name(number)

	puts "Please enter the " + number + " player's name; enter 'x' to exit the game"
	name = gets.chomp
	if name == "x"
		exit_program
	elsif name.length == 0
		name = number.slice(0,1).upcase + number.slice(1,number.length-1) + " Player"
	end

	name

end


def main_menu

	puts "\n"
	puts "*" * 60
	puts ("\u297c " * 8) + "Welcome to the Go Fish! game" + (" \u297d" * 8)
	puts "*" * 60
	puts "\n"

	the_game = Game.new
	the_game.deck.fill
	the_game.deck.shuffle
	complete_face_card_name = {"J"=>"Jack", "Q"=>"Queen", "K"=>"King", "A"=>"Ace"}

	name0 = get_player_name("first")
	name1 = get_player_name("second")

	first_player_index = rand.round

	if first_player_index == 0
		the_game.players << Player.new({:name=>name0})
		the_game.players << Player.new({:name=>name1})
	else
		the_game.players << Player.new({:name=>name1})
		the_game.players << Player.new({:name=>name0})
	end

	puts "\n#{the_game.players[0].name} plays first\n"

	for card_index in (1..7)
		for player_index in (0..1)
			new_card = the_game.deck.deal_top_card
			the_game.players[player_index].hand.cards << new_card
			if card_index > 3
				if the_game.players[player_index].hand.book_of_rank(new_card) != 0
					the_game.players[player_index].award_point
				end
			end
		end
	end

	puts "\nThere are #{the_game.deck.cards.length} cards left in the deck.\n"

	player_index = 0
	response = ""

	while !the_game.players[player_index].hand.valid_card_to_request?(response)[:result] &&
			  !the_game.game_over[:result]
		plural = ""
		if the_game.players[player_index].points == 0 || the_game.players[player_index].points > 1
			plural = "s"
		end
		puts "\n" + the_game.players[player_index].name + ", you have " + the_game.players[player_index].points.to_s +
				 " point#{plural} and your current hand is"
		the_game.players[player_index].hand.print
		puts "\nWhat card number would you like to request? You may enter 'x' to exit the program"
		response = gets.chomp.downcase
		if response == "x"
			exit_program
		end
		if the_game.players[player_index].hand.valid_card_to_request?(response)[:result]
			card_number_to_request = the_game.players[player_index].hand.valid_card_to_request?(response)[:rank]
			if card_number_to_request > 10
				card_number_to_display = complete_face_card_name[response.slice(0,1).upcase]
			else
				card_number_to_display = card_number_to_request.to_s
			end
			puts "\nYou asked #{the_game.players[player_index ^ 1].name} for all of their " + 
					 "#{card_number_to_display}s"
			cards_found = the_game.players[player_index ^ 1].hand.find_in_hand(card_number_to_request, true)
			if cards_found.length > 0
				plural = ""
				if cards_found.length > 1
					plural = "s"
				end
				puts "\nYou received #{cards_found.length.to_s} card#{plural} from #{the_game.players[player_index ^ 1].name}"
				the_game.players[player_index].hand.put_cards_in_hand(cards_found)
				cards_found.each do |card|
					if the_game.players[player_index].hand.book_of_rank(card) > 0
						the_game.players[player_index].award_point
						plural = ""
						if the_game.players[player_index].points > 1
							plural = "s"
						end
						puts "\nYou completed a book of #{card.print("rank")}s so you now have #{the_game.players[player_index].points.to_s} " +
								 "point#{plural}"
					end
				end
			else
				card_drawn = the_game.deck.deal_top_card
				puts "\n\u297e \u297f Go fish! \u297f \u297e You drew the #{card_drawn.print("all")}"
				the_game.players[player_index].hand.put_cards_in_hand([card_drawn])
				if the_game.players[player_index].hand.book_of_rank(card_drawn) > 0
					the_game.players[player_index].award_point
					plural = ""
					if the_game.players[player_index].points > 1
						plural = "s"
					end
					puts "\nYou completed a book of #{card_drawn.print("rank")}s so you now have #{the_game.players[player_index].points.to_s} " +
							 "point#{plural}"
				end
				if card_drawn.rank == card_number_to_request && !the_game.game_over[:result]
					puts "\nYou had asked for this card number, so you get another turn"
				elsif !the_game.game_over[:result]
					player_index = player_index ^ 1
					puts "\n#{the_game.players[player_index].name} plays next\n"
					plural = ""
					if the_game.deck.cards.length != 1
						plural = "s"
					end
					puts "\nThere are #{the_game.deck.cards.length} cards left in the deck.\n"
				end
			end
			response = ""
		else
			puts the_game.players[player_index].hand.valid_card_to_request?(response)[:reason]
		end
	end

	puts "\n\n" + ("*" * 50)
	puts ("\u297d " * 8) + "THE GAME IS OVER!!" + (" \u297c" * 8)
	puts ("*" * 50) + "\n"
	puts "\n" + the_game.game_over[:winner]
	puts "\n\n"
	puts "Thanks for playing \u297e \u297f Go Fish! \u297f \u297e"
	puts "\n"

end


main_menu
