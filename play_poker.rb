require_relative 'lib/deal_hands'
require_relative 'lib/hand_rank'
require_relative 'lib/find_winner'

puts "How many players? (Please enter a number between 1 and 10)"
number_of_players = gets
number_of_players = number_of_players.to_i
while number_of_players < 1 || number_of_players > 10
  puts "Number of players needs to be a number between 1 and 10"
  puts "How many players?"
  number_of_players = gets
  number_of_players = number_of_players.to_i
end

players_hands = DealHands.new(number_of_players).players_hands

poker_hand_ranks = {
  1 => "Straight Flush",
  2 => "Four of a Kind",
  3 => "Full House",
  4 => "Flush",
  5 => "Straight",
  6 => "Three of a Kind",
  7 => "Two Pair",
  8 => "One Pair",
  9 => "High Card"
}

for i in 0..(players_hands.count-1)
  player_hand = players_hands[i]
  rank = HandRank.new(player_hand).execute
  player_hand_array = []
  for j in 0..4
    player_hand_array.push(player_hand[j].values.join(""))
  end
  puts "Player " + (i+1).to_s + ": " + player_hand_array.join(", ") + " - " + poker_hand_ranks[rank]
end

winning_hand = FindWinner.new(players_hands).execute
puts "Player " + (winning_hand+1).to_s + " wins!"
