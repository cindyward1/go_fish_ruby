require "../lib/deck.rb"
require "../lib/player.rb"
require "../lib/hand.rb"
require "../lib/card.rb"

def main_menu

	the_deck = Deck.new
	the_deck.fill
	the_deck.shuffle

	the_hand = Hand.new
	the_deck.cards.each_with_index do |card, index|
		the_hand.cards << card
		puts "#{index+1}. #{card.print("rank")}"
	end

	the_hand.print

end

main_menu