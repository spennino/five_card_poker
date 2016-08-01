require_relative '../lib/check_hand'

straight_flush = [
  {:card_value=>"A", :card_suit=>"♥"},
  {:card_value=>"K", :card_suit=>"♥"},
  {:card_value=>"Q", :card_suit=>"♥"},
  {:card_value=>"J", :card_suit=>"♥"},
  {:card_value=>"10", :card_suit=>"♥"}
]

flush = [
  {:card_value=>"K", :card_suit=>"♥"},
  {:card_value=>"8", :card_suit=>"♥"},
  {:card_value=>"7", :card_suit=>"♥"},
  {:card_value=>"A", :card_suit=>"♥"},
  {:card_value=>"2", :card_suit=>"♥"}
]

straight = [
  {:card_value=>"K", :card_suit=>"♥"},
  {:card_value=>"Q", :card_suit=>"♦"},
  {:card_value=>"J", :card_suit=>"♠"},
  {:card_value=>"10", :card_suit=>"♥"},
  {:card_value=>"9", :card_suit=>"♦"}
]

four_of_a_kind = [
  {:card_value=>"K", :card_suit=>"♥"},
  {:card_value=>"K", :card_suit=>"♦"},
  {:card_value=>"K", :card_suit=>"♠"},
  {:card_value=>"K", :card_suit=>"♣"},
  {:card_value=>"9", :card_suit=>"♦"}
]

three_of_a_kind = [
  {:card_value=>"K", :card_suit=>"♥"},
  {:card_value=>"K", :card_suit=>"♦"},
  {:card_value=>"K", :card_suit=>"♠"},
  {:card_value=>"J", :card_suit=>"♣"},
  {:card_value=>"9", :card_suit=>"♦"}
]
