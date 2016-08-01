require_relative 'deck'

class DealHands
  def initialize(number_of_players)
    @number_of_players = number_of_players
    @deck = Deck.new().deck
  end

  attr_reader :number_of_players, :deck

  def players_hands
    deck_remaining = deck
    player_hands = []
    for i in 1..number_of_players
      player_hand = []
      for j in 1..5
        random_card_index = rand(deck_remaining.count)
        card_delt = deck_remaining[random_card_index]
        player_hand.push(card_delt)
        deck_remaining.delete(card_delt)
      end
      player_hands.push(player_hand)
    end

    player_hands
  end
end
