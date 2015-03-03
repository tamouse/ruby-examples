class Card

  @@rank_short_names = ['2','3','4','5','6','7','8','9','10','J','Q','K']
  @@rank_names = ['Duece', 'Trey', 'Four', 'Five', 'Six', 'Seven',
                  'Eight', 'Niner', 'Ten', 'Jack', 'Queen', 'King',
                  'Ace']

  @@suit_names = [:clubs, :diamonds, :hearts, :spades].reduce({}) {|h,key| h[key]= key.to_s.capitalize; h}
  @@suit_score = {clubs: 0, diamonds: 20, hearts: 40, spades: 60}

  attr_accessor :rank, :suit
  def initialize(rank,suit)
    @rank = rank
    @suit = suit
  end

  def long_name
    "#{@@rank_names[self.rank]} of #{@@suit_names[self.suit]}"
  end

  def short_name
    "#{@@rank_short_names[self.rank]}#{@@suit_names[self.suit][0]}"   
  end

  def to_s
    self.long_name
  end
  
  def value
    self.rank + @@suit_score[self.suit]
  end
  
end