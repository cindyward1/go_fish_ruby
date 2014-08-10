
go_fish_ruby
====================

README for Go Fish game written in Ruby

* Author: Cindy Ward <cindyward@yahoo.com>
* Date created: August 9, 2014
* Last modification date: August 9, 2014
* Created for:  Epicodus, Summer 2014 session

Included; written by author:
* ./README.md (this file)
* ./LICENSE.md (using the "Unlicense" template)
* ./go_fish.rb
* ./lib/card.rb
* ./lib/game.rb
* ./lib/player.rb
* ./lib/pool.rb
* ./spec/card.rb
* ./spec/game_spec.rb
* ./spec/player_spec.rb
* ./spec/pool.rb


Requirements for execution
* The Ruby language interpreter must be installed
* git clone the image at http://github.com/cindyward1/go_fish_ruby, which will create a go_fish_ruby directory
* To play the game, cd to (location)/go_fish_ruby and enter the following at terminal application prompt $: Ruby go_fish.rb

Description:
This Ruby application allows 2 players to play the game, Go Fish. [The Go Fish game rules](http://en.wikipedia.org/wiki/Go_fish) implemented in this application are as follows: 
* 1) A deck of 52 cards is randomly shuffled using [the modern Durstenfeld algorithm](http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle#The_modern_algorithm)
* 2) The first player is randomly chosen. 
* 3) Each player is alternately dealt a hand of 7 cards, starting with the chosen first player.
* 4) The first player plays by asking the second player for all of his cards of the same rank as one of the cards in the first player's hand. The second player gives the requested cards to the first player, and the first player continues to play. If the cards received from the second player causes the first player to obtain a "book" of 4 cards of the same rank, he removes the cards from his hand and is awarded a point. If the second player does not have any cards of the requested rank, the first player is told to "Go fish" and draws a card from the top of the remaining deck. If the first player draws a card of the requested rank, he continues to play. If he draws any other card, even one that causes him to obtain a book and score a point, play passes to the second player.
5) Play alternates between the 2 players until all of the cards are gone or one of the players runs out of cards. 
6) The winner is the player with the highest number of points.
