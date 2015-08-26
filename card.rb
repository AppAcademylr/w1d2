class Card
  def initialize(f_val)
    @f_val = f_val
    @f_show = false
    @f_del  = false
  end

  attr_accessor :f_val, :f_show, :f_del

  def hide
    self.f_show = false
  end

  def reveal
    self.f_show = true
    self.to_s
  end

  def to_s
    name_of_card = ""
    temp = self.f_val%13
    case temp
    when 0
      name_of_card += "Ace"
    when 12
      name_of_card += "King"
    when 11
      name_of_card += "Queen"
    when 10
      name_of_card += "Jack"
    else
      name_of_card += (temp+1).to_s
    end

    name_of_card += " of "

    temp = self.f_val/13

    case temp
    when 0
      name_of_card+= "Diamonds"
    when 1
      name_of_card += "Hearts"
    when 2
      name_of_card += "Spades"
    when 3
      name_of_card += "Clubs"
    end
    name_of_card
  end

  def ==(card2)
    self.f_val == card2.f_val
  end
end
