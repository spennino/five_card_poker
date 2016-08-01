require_relative 'deck'

class CheckHand
  def initialize(player_hand)
    @player_hand = player_hand
    @deck = Deck.new()
    @deck_card_values = @deck.card_values
  end

  def execute
    return "Straight Flush" if straight_flush?
    return "Four of a Kind" if four_of_a_kind?
    return "Full House" if full_house?
    return "Flush" if flush?
    return "Straight" if straight?
    return "Three of a Kind" if three_of_a_kind?
    return "Two Pair" if two_pair?
    return "One Pair" if one_pair?
    return "High Card is " + high_card
  end

  private

  attr_reader :player_hand, :deck_card_values

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    card_counts.values.any? { |value| value == 4 }
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def flush?
    suits.uniq.length == 1
  end

  def straight?
    indexes.max - indexes.min == 4 && card_values.uniq.length == 5
  end

  def three_of_a_kind?
    card_counts.values.any? { |value| value == 3 }
  end

  def two_pair?
    pairs.length == 2
  end

  def one_pair?
    pairs.length == 1
  end

  def high_card
    deck_card_values[indexes.max]
  end

  def suits
    player_hand.each_with_object([]) do |card, suits|
      suits.push(card[:card_suit])
    end
  end

  def card_values
    player_hand.each_with_object([]) do |card, card_values|
      card_values.push(card[:card_value])
    end
  end

  def indexes
    card_values.map { |value| deck_card_values.index(value) }
  end

  def card_counts
    player_hand.each_with_object(Hash.new 0) do |card, card_counts|
      card_value = card[:card_value]
      card_counts[card_value] += 1
    end
  end

  def pairs
    card_counts.select { |card| card_counts[card] == 2}
  end
end
