module Blackjack
  def self.parse_card(_card)
    case _card
    when 'ace' then 11
    when 'two' then 2
    when 'three' then 3
    when 'four' then 4
    when 'five' then 5
    when 'six' then 6
    when 'seven' then 7
    when 'eight' then 8
    when 'nine' then 9
    when 'ten', 'jack', 'queen', 'king' then 10
    else 0
    end
  end

  def self.card_range(_card1, _card2)
    case (parse_card(_card1) + parse_card(_card2))
    when 4..11 then 'low'
    when 12..16 then 'mid'
    when 17..20 then 'high'
    when 21 then 'blackjack'
    end
  end

  def self.first_turn(_card1, _card2, _dealer_card)
    return 'P' if _card1 === 'ace' && _card2 === 'ace'

    if card_range(_card1, _card2) == 'blackjack'
      return 'W' if parse_card(_dealer_card) < 10

      return 'S'

    end

    case card_range(_card1, _card2)
    when 'low'
      'H'
    when 'mid'
      if parse_card(_dealer_card) >= 7
        'H'
      else
        'S'
      end
    when 'high'
      'S'
    end
  end
end
