class BreakTie
  def initialize(winning_hands, highest_rank)
    @winning_hands = winning_hands
    @highest_rank = highest_rank
  end

  attr_reader :winning_hands, :highest_rank

  def execute
    if highest_rank == 1
      return royal_flush_tie_breaker(winning_hands)
    elsif highest_rank == 2
      return x_of_a_kind_tie_breaker(winning_hands, 4)
    elsif highest_rank == 3
      return x_of_a_kind_tie_breaker(winning_hands, 3)
    elsif highest_rank == 4
      return flush_tie_break(winning_hands)
    elsif highest_rank == 5
      return high_card_tie_break(winning_hands)
    elsif highest_rank == 6
      return x_of_a_kind_tie_breaker(winning_hands, 3)
    elsif highest_rank == 7
      return x_of_a_kind_tie_breaker(winning_hands, 2)
    elsif highest_rank == 8
      return x_of_a_kind_tie_breaker(winning_hands, 2)
    elsif highest_rank == 9
      return high_card_tie_break(winning_hands)
    end
  end

  private

  def suit_ranks
    {
      "♦"=>4,
      "♣"=>3,
      "♥"=>2,
      "♠"=>1
    }
  end

  def value_ranks
    {
      "2"=>13,
      "3"=>12,
      "4"=>11,
      "5"=>10,
      "6"=>9,
      "7"=>8,
      "8"=>7,
      "9"=>6,
      "10"=>5,
      "J"=>4,
      "Q"=>3,
      "K"=>2,
      "A"=>1
    }
  end

  def royal_flush_tie_breaker(winning_hands)
    winning_hands.each_with_object({}) do |hand, ranks|
      ranks[hand] = suit_ranks[hand[0][:card_suit]]
    end
    winner = ranks.select{|hand,rank| rank == ranks.values.min }
    return winner[0]
  end

  def x_of_a_kind_tie_breaker(winning_hands, x)
    ranks = winning_hands.each_with_object({}) do |hand, ranks|
      card_counts = card_counts(hand)
      x_card = card_counts.select{|card, count| count == x }.keys().first
      ranks[hand] = value_ranks[x_card]
    end
    winner = ranks.select{|hand,rank| rank == ranks.values().min }.first
    return winner[0]
  end

  def card_counts(player_hand)
    player_hand.each_with_object(Hash.new 0) do |card, card_counts|
      card_value = card[:card_value]
      card_counts[card_value] += 1
    end
  end

  def flush_tie_break(winning_hands)
    ranks = {}
    winning_hands.each_with_index do |hand, i|
      suit = hand[0][:card_suit]
      ranks[i] = suit_ranks[suit]
    end
    winning_index = ranks.sort_by{ |i, rank| rank }.first[0]
    return winning_hands[winning_index]
  end

  def high_card_tie_break(winning_hands)
    high_cards = {}
    winning_hands.each_with_index do |hand, i|
      ranks = hand.each_with_object({}) do |card, ranks|
        ranks[card] = {
                        :value_rank => value_ranks[card[:card_value]],
                        :suit_rank => suit_ranks[card[:card_suit]]
                      }
      end
      high_card = ranks.sort_by{|card, ranks| ranks[:value_rank]}.first
      high_cards[i] = high_card
    end
    highest_card = high_cards.sort_by{|i, card| card[1][:value_rank]}.first
    highest_rank = highest_card[1][1][:value_rank]
    hands_with_highest_card = high_cards.select{|i,card| card[1][:value_rank] == highest_rank }
    if hands_with_highest_card.keys().length == 1
      winning_index = hands_with_highest_card.keys().first
      return winning_hands[winning_index]
    else
      top_hand = hands_with_highest_card.sort_by{|i,card| card[1][:suit_rank]}.first
      winning_index = top_hand[0]
      return winning_hands[winning_index]
    end
  end
end
