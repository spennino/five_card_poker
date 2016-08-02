require_relative '../lib/break_tie'

class BreakTieTest
  def run
    pair_of_kings = [
      {:card_value=>"K", :card_suit=>"♥"},
      {:card_value=>"K", :card_suit=>"♦"},
      {:card_value=>"10", :card_suit=>"♠"},
      {:card_value=>"J", :card_suit=>"♣"},
      {:card_value=>"9", :card_suit=>"♦"}
    ]
    pair_of_nines = [
      {:card_value=>"A", :card_suit=>"♥"},
      {:card_value=>"9", :card_suit=>"♦"},
      {:card_value=>"9", :card_suit=>"♠"},
      {:card_value=>"2", :card_suit=>"♣"},
      {:card_value=>"3", :card_suit=>"♦"}
    ]
    one_pair_tie = [pair_of_kings, pair_of_nines]
    puts "Testing Break Tie"
    puts "Testing One Pair Tie"
    if BreakTie.new(one_pair_tie,8).execute == pair_of_kings
      puts "OK"
    else
      puts "FAIL"
    end
  end
end
