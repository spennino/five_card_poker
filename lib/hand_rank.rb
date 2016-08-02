require_relative 'deck'

class HandRank
  def initialize(player_hand)
    @player_hand = player_hand
    @deck = Deck.new()
    @deck_card_values = @deck.card_values
  end

  def execute
    if straight_flush?
      return 1
    elsif four_of_a_kind?
      return 2
    elsif full_house?
      return 3
    elsif flush?
      return 4
    elsif straight?
      return 5
    elsif three_of_a_kind?
      return 6
    elsif two_pair?
      return 7
    elsif one_pair?
      return 8
    else
      return 9
    end
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
