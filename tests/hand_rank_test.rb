require_relative '../lib/hand_rank'

class HandRankTest
  @@hand_ranks = {
      "straight_flush"=>1,
      "four_of_a_kind"=>2,
      "full_house"=>3,
      "flush"=>4,
      "straight"=>5,
      "three_of_a_kind"=>6,
      "two_pair"=>7,
      "one_pair"=>8,
      "high_card"=>9
  }
  @@possible_hands = {
    "straight_flush" => [
      {:card_value=>"A", :card_suit=>"♥"},
      {:card_value=>"K", :card_suit=>"♥"},
      {:card_value=>"Q", :card_suit=>"♥"},
      {:card_value=>"J", :card_suit=>"♥"},
      {:card_value=>"10", :card_suit=>"♥"}
    ],
    "flush" => [
      {:card_value=>"K", :card_suit=>"♥"},
      {:card_value=>"8", :card_suit=>"♥"},
      {:card_value=>"7", :card_suit=>"♥"},
      {:card_value=>"A", :card_suit=>"♥"},
      {:card_value=>"2", :card_suit=>"♥"}
    ],
    "straight" => [
      {:card_value=>"K", :card_suit=>"♥"},
      {:card_value=>"Q", :card_suit=>"♦"},
      {:card_value=>"J", :card_suit=>"♠"},
      {:card_value=>"10", :card_suit=>"♥"},
      {:card_value=>"9", :card_suit=>"♦"}
    ],
    "four_of_a_kind" => [
      {:card_value=>"K", :card_suit=>"♥"},
      {:card_value=>"K", :card_suit=>"♦"},
      {:card_value=>"K", :card_suit=>"♠"},
      {:card_value=>"K", :card_suit=>"♣"},
      {:card_value=>"9", :card_suit=>"♦"}
    ],
    "full_house" => [
      {:card_value=>"K", :card_suit=>"♥"},
      {:card_value=>"K", :card_suit=>"♦"},
      {:card_value=>"K", :card_suit=>"♠"},
      {:card_value=>"9", :card_suit=>"♣"},
      {:card_value=>"9", :card_suit=>"♦"}
    ],
    "three_of_a_kind" => [
      {:card_value=>"K", :card_suit=>"♥"},
      {:card_value=>"K", :card_suit=>"♦"},
      {:card_value=>"K", :card_suit=>"♠"},
      {:card_value=>"J", :card_suit=>"♣"},
      {:card_value=>"9", :card_suit=>"♦"}
    ],
    "two_pair" => [
      {:card_value=>"K", :card_suit=>"♥"},
      {:card_value=>"K", :card_suit=>"♦"},
      {:card_value=>"J", :card_suit=>"♠"},
      {:card_value=>"J", :card_suit=>"♣"},
      {:card_value=>"9", :card_suit=>"♦"}
    ],
    "one_pair" => [
      {:card_value=>"K", :card_suit=>"♥"},
      {:card_value=>"K", :card_suit=>"♦"},
      {:card_value=>"10", :card_suit=>"♠"},
      {:card_value=>"J", :card_suit=>"♣"},
      {:card_value=>"9", :card_suit=>"♦"}
    ],
    "high_card" => [
      {:card_value=>"A", :card_suit=>"♥"},
      {:card_value=>"K", :card_suit=>"♦"},
      {:card_value=>"10", :card_suit=>"♠"},
      {:card_value=>"J", :card_suit=>"♣"},
      {:card_value=>"9", :card_suit=>"♦"}
    ]
  }

  def run
    puts "Testing Hand Rank"
    @@possible_hands.each do |hand_name, cards|
      puts "Testing " + hand_name
      if HandRank.new(cards).execute == @@hand_ranks[hand_name]
        puts "OK"
      else
        "FAIL"
      end
    end
  end
end
