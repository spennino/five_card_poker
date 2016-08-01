class Deck
  def card_values
    ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
  end

  def card_suits
    ["♦","♣","♥","♠"]
  end

  def deck
    card_values.each_with_object([]) do |c, deck|
      card_suits.each do |s|
        card = {card_value: c, card_suit: s}
        deck.push(card)
      end
    end
  end
end
