require_relative 'hand_rank'
require_relative 'break_tie'

class FindWinner
  def initialize(players_hands)
    @players_hands = players_hands
  end

  attr_reader :players_hands

  def execute
    ranks = {}
    players_hands.each_with_index do |player_hand, i|
      ranks[i] = HandRank.new(player_hand).execute
    end
    highest_rank = ranks.values.min
    winning_hands = ranks.select{ |index,rank| rank == highest_rank }.keys()
    if winning_hands.length == 1
      return winning_hands[0]
    else
      return tie_break(winning_hands, highest_rank)
    end
  end

  private

  def tie_break(winning_hand_indexes, highest_rank)
    tied_hands = winning_hand_indexes.each_with_object([]) do |hand_number, tied_hands|
      tied_hands.push(players_hands[hand_number])
    end
    winner = BreakTie.new(tied_hands, highest_rank).execute
    return players_hands.index(winner)
  end
end
