
go_fish_ruby
====================

README for Go Fish game written in Ruby

* Author: Cindy Ward <cindyward@yahoo.com>
* Date created: August 9, 2014
* Last modification date: August 10, 2014
* Created for:  Epicodus, Summer 2014 session

Included; written by author:
* ./README.md (this file)
* ./LICENSE.md (using the "Unlicense" template)
* ./go_fish.rb (main application file)
* ./lib/card.rb (class Card implementation)
* ./lib/deck.rb (class Deck implementation)
* ./lib/game.rb (class Game implementation)
* ./lib/hand.rb (class Hand implementation)
* ./lib/player.rb (class Player implementation)
* ./spec/card_spec.rb (test cases for class Card)
* ./spec/deck_spec.rb (test cases for class Deck)
* ./spec/game_spec.rb (test cases for class Game)
* ./spec/hand_spec.rb (test cases for class Hand)
* ./spec/player_spec.rb (test cases for class Player)
* ./spec/print_test.rb (utility application to test printing the deck and individual cards)

Requirements for execution:
* [The Ruby language interpreter](https://www.ruby-lang.org/en/downloads/) must be installed. Please use version 2.1.2. 
* [git clone](http://github.com/) the image available at http://github.com/cindyward1/go_fish_ruby, which will create a go_fish_ruby directory with lib and spec subdirectories.
* To play the game, cd to (clone location)/go_fish_ruby and enter the following at a terminal application prompt $: ruby go_fish.rb
* You can also test a non-interactive version of the method against its test cases found in (your working directory)/go_fish_ruby/spec/*.rb using [rspec](https://rubygems.org/gems/rspec). Please use version 3.1.1. To run rspec, cd to (clone location)/go_fish_ruby and enter the following string at a terminal application $: "rspec" (This command will automatically execute any .rb file it finds in ./spec/.)
* Please note that this repository has only been tested with [Google Chrome browser](http://www.google.com/intl/en/chrome/browser) version 36.0.1985.125 on an iMac running [Apple](http://www.apple.com) OS X version 10.9.4 (Mavericks). Execution on any other computing platform, browser or operating system is at the user's risk.

Description:
This Ruby application allows 2 interactive players to play the game, Go Fish. [The Go Fish game rules](http://en.wikipedia.org/wiki/Go_fish) implemented in this application are as follows: 
* 1) A deck of 52 unique cards (ranks 2 through Ace, suits Clubs, Diamonds, Hearts, and Spades) is randomly shuffled using [the modern Durstenfeld algorithm](http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle#The_modern_algorithm)
* 2) The first player is randomly chosen. 
* 3) Each player is alternately dealt a hand of 7 cards, starting with the chosen first player.
* 4) The first player plays by asking the second player for all of his cards of the same rank as one of the cards in the first player's hand. The second player gives the requested cards to the first player, and the first player continues to play. If the cards received from the second player causes the first player to obtain a "book" of 4 cards of the same rank, he removes the cards from his hand and is awarded a point. If the second player does not have any cards of the requested rank, the first player is told to "Go fish" and draws a card from the top of the remaining deck. If the first player draws a card of the requested rank, he continues to play. If he draws any other card, even one that causes him to obtain a book and score a point, play passes to the second player.
5) Play alternates between the 2 players until all of the cards are gone or one of the players runs out of cards. 
6) The winner is the player with the highest number of points.
