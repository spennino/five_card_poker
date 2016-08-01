require_relative 'lib/deal_hands'
require_relative 'lib/check_hand'

puts "How many players?"
number_of_players = gets # TODO force this to be int
number_of_players = number_of_players.to_i

players_hands = DealHands.new(number_of_players).players_hands

for i in 0..(players_hands.count-1)
  player_hand = players_hands[i]
  hand_type = CheckHand.new(player_hand).execute
  player_hand_array = []
  for j in 0..4
    player_hand_array.push(player_hand[j].values.join(""))
  end
  puts "Player " + (i+1).to_s + ": " + player_hand_array.join(", ") + " - " + hand_type
end
